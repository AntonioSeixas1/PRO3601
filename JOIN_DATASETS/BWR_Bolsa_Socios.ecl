IMPORT $, STD;

BolsaFamilia := $.File_MergedBolsaFamilia;
Socios := $.File_MergedSocios;

// DATABASE Bolsa Familia
// Removendo os registros cujo CPF não está preenchido e tirando a pontuação dos CPF'S/CNPJ'S
Layout_Bolsa_Familia_Filtered := RECORD
	BolsaFamilia.File.NOME_FAVORECIDO;
	CPF_FAVORECIDO := STD.Str.FilterOut(BolsaFamilia.File.CPF_FAVORECIDO, '*.-');
	BolsaFamilia.File.UF;
END;

Bolsa_F := TABLE(BolsaFamilia.File(CPF_FAVORECIDO <> '' AND NOME_FAVORECIDO <> ''), Layout_Bolsa_Familia_Filtered);
Bolsa_UV := DEDUP(Bolsa_F, NOME_FAVORECIDO, CPF_FAVORECIDO);

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

Rec_SociosComBolsa := RECORD
	Socios_UV;
	STRING2 UF := '';
	UNSIGNED1 Beneficio := 2;
END;

Rec_SociosComBolsa transf(Layout_Socios_Filtered Le, Layout_Bolsa_Familia_Filtered Ri) := TRANSFORM
	SELF := Le;
	SELF.UF := Ri.UF;
END;


Socios_Bolsa := JOIN(Socios_UV,
                Bolsa_UV ,
                LEFT.NOME_SOCIO_RAZAO_SOCIAL = RIGHT.NOME_FAVORECIDO AND LEFT.CPF_MASC_SOCIO = RIGHT.CPF_FAVORECIDO,
                transf(LEFT, RIGHT));


OUTPUT(Socios_Bolsa,, '~grupo7::Socios_Bolsa', OVERWRITE, NAMED('JOIN_Socios_e_Bolsa'));


