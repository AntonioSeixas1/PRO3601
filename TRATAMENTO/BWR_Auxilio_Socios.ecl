IMPORT $, STD;

Auxilio := $.File_MergedAuxilioEmergencial;
Socios := $.File_MergedSocios;

// DATABASE Auxilio Emergencial
// Removendo os registros cujo CPF não está preenchido e tirando a pontuação dos CPF'S/CNPJ'S
Layout_AuxilioSemPontos := RECORD
	CPF_beneficiario := STD.Str.FilterOut(Auxilio.File.CPF_beneficiario, '*.-');
	Auxilio.File;
	
END;

Auxilio_sem_pontos := TABLE(Auxilio.File(CPF_beneficiario <> '' AND NOME_beneficiario <> ''), Layout_AuxilioSemPontos);
Auxilio_Valores_Unicos := DEDUP(Auxilio_sem_pontos, NOME_beneficiario, CPF_beneficiario);



// DATABASE Socios
// Removendo os registros cujo CPF não está preenchido e tirando a pontuação dos CPF'S/CNPJ'S
Layout_SociosSemPontos := RECORD
	cnpj_cpf_socio := STD.Str.FilterOut(Socios.File.cnpj_cpf_socio, '*.-');
	Socios.File;
END;

Socios_sem_pontos := TABLE(Socios.File(cnpj_cpf_socio <> '' AND NOME_SOCIO_RAZAO_SOCIAL <> ''), Layout_SociosSemPontos);



// Nova estrutura RECORD
Rec_newsocios := RECORD
	string69 NOME_beneficiario_auxilio := '';
	STRING32 Observacao := '';
	Socios.File;
END;


// TRANSFORM para fazer o JOIN
Rec_newsocios transf(Layout_SociosSemPontos Le, Layout_AuxilioSemPontos Ri) := TRANSFORM
	SELF.NOME_beneficiario_auxilio := Ri.NOME_beneficiario;
	SELF.Observacao := Ri.Observacao;
	SELF := Le;
END;

// JOIN DATABASE
Socios_Auxilio := JOIN(Socios_sem_pontos,
                Auxilio_Valores_Unicos ,
                LEFT.cnpj_cpf_socio = RIGHT.CPF_beneficiario AND LEFT.NOME_SOCIO_RAZAO_SOCIAL = RIGHT.NOME_beneficiario,
                transf(LEFT, RIGHT));

// Observacoes
Layout_Observacoes := RECORD
	Observacao:= Socios_Auxilio.Observacao;
	Contagem := COUNT(GROUP);
END;

CategoriasObservacao := TABLE(Socios_Auxilio, Layout_Observacoes, Observacao);



OUTPUT(Socios_Auxilio, NAMED('JOIN_Socios_e_Auxilio'));
OUTPUT(CategoriasObservacao, NAMED('Contagem_Observacoes'))




