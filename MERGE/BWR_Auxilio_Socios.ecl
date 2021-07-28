IMPORT $, STD;

AuxilioEmergencial := $.File_MergedAuxilioEmergencial;
Socios := $.File_MergedSocios;

// DATABASE Auxilio Emergencial
// Removendo os registros cujo CPF não está preenchido e tirando a pontuação dos CPF'S/CNPJ'S
Layout_Auxilio_Emergencial_Filtered := RECORD
	AuxilioEmergencial.File.NOME_beneficiario;
	CPF_beneficiario := STD.Str.FilterOut(AuxilioEmergencial.File.CPF_beneficiario, '*.-');
	AuxilioEmergencial.File.UF;
	AuxilioEmergencial.File.Observacao;
END;

Auxilio_F := TABLE(AuxilioEmergencial.File(CPF_beneficiario <> '' AND NOME_beneficiario <> ''), Layout_Auxilio_Emergencial_Filtered);
Auxilio_UV := DEDUP(Auxilio_F, NOME_beneficiario, CPF_beneficiario);



// DATABASE Socios
// Removendo os registros cujo CPF não está preenchido e tirando a pontuação dos CPF'S/CNPJ'S
Layout_Socios_Filtered := RECORD
	Socios.file.NOME_SOCIO_RAZAO_SOCIAL;
	CPF_MASC_SOCIO := STD.Str.FilterOut(Socios.File.cnpj_cpf_socio, '*.-');
	Socios.file.QUALIFICACAO_SOCIO;
	Socios.file.FAIXA_ETARIA;
	Socios.file.CNPJ_BASICO;
END;

Socios_F := TABLE(Socios.File(cnpj_cpf_socio <> '' AND NOME_SOCIO_RAZAO_SOCIAL <> ''), Layout_Socios_Filtered);
Socios_UV := DEDUP(Socios_F, NOME_SOCIO_RAZAO_SOCIAL, CPF_MASC_SOCIO, CNPJ_BASICO);

// Nova estrutura RECORD
Rec_SociosComAuxilio := RECORD
	Socios_UV;
	STRING2 UF := '';
	STRING32 Observacao_do_Auxilio_Emergencial := '';
	UNSIGNED1 Beneficio := 1; 
END;


// TRANSFORM para fazer o JOIN
Rec_SociosComAuxilio transf(Layout_Socios_Filtered Le, Layout_Auxilio_Emergencial_Filtered Ri) := TRANSFORM
	SELF := Le;
	SELF.UF := Ri.UF;
	SELF.Observacao_do_Auxilio_Emergencial := if(Ri.Observacao = '', 'EM BRANCO', if(Ri.Observacao = 'Não há', 'SEM OBSERVACAO', STD.Str.ToUpperCase(Ri.Observacao)));
END;

// JOIN DATABASE
Socios_Auxilio := JOIN(Socios_UV,
                Auxilio_UV ,
                LEFT.NOME_SOCIO_RAZAO_SOCIAL = RIGHT.NOME_beneficiario AND LEFT.CPF_MASC_SOCIO = RIGHT.CPF_beneficiario,
                transf(LEFT, RIGHT));



OUTPUT(Socios_Auxilio,, '~grupo7::Socios_Auxilio', OVERWRITE, NAMED('JOIN_Socios_e_Auxilio'));
//OUTPUT(Socios_Auxilio)






