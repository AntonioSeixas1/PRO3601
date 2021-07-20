IMPORT $, STD;

Bolsa := $.File_MergedBolsaFamilia;
Socios := $.File_MergedSocios;

// DATABASE Bolsa Familia
// Removendo os registros cujo CPF não está preenchido e tirando a pontuação dos CPF'S/CNPJ'S
Layout_BolsaSemPontos := RECORD
	CPF_FAVORECIDO := STD.Str.FilterOut(Bolsa.File.CPF_FAVORECIDO, '*.-');
	//STRING20 Primeiro_Nome := STD.STr.SplitWords(Bolsa.File.NOME_FAVORECIDO,' ')[1];
	Bolsa.File;
	
END;

Bolsa_sem_pontos1 := SORT(TABLE(Bolsa.File(CPF_FAVORECIDO <> '' AND NOME_FAVORECIDO <> ''), Layout_BolsaSemPontos), NOME_FAVORECIDO);

Bolsa_sem_pontos := DEDUP(Bolsa_sem_pontos1, NOME_FAVORECIDO);

// DATABASE Socios
// Removendo os registros cujo CPF não está preenchido e tirando a pontuação dos CPF'S/CNPJ'S
Layout_SociosSemPontos := RECORD
	cnpj_cpf_socio := STD.Str.FilterOut(Socios.File.cnpj_cpf_socio, '*.-');
	//STRING20 Primeiro_Nome := STD.STr.SplitWords(Socios.File.NOME_SOCIO_RAZAO_SOCIAL,' ')[1];
	Socios.File;
	
END;

Socios_sem_pontos := TABLE(Socios.File(cnpj_cpf_socio <> '' AND NOME_SOCIO_RAZAO_SOCIAL <> ''), Layout_SociosSemPontos);


Rec_newsocios := RECORD
	string69 NOME_FAVORECIDO_BOLSA := '';
	Socios.File;
END;


Rec_newsocios transf(Layout_SociosSemPontos Le, Layout_BolsaSemPontos Ri) := TRANSFORM
	SELF.NOME_FAVORECIDO_BOLSA := Ri.NOME_FAVORECIDO;
	SELF := Le;
END;


Socios_Bolsa := JOIN(Socios_sem_pontos,
                Bolsa_sem_pontos ,
                LEFT.cnpj_cpf_socio = RIGHT.CPF_FAVORECIDO  AND LEFT.NOME_SOCIO_RAZAO_SOCIAL = RIGHT.NOME_FAVORECIDO,
                transf(LEFT, RIGHT));


OUTPUT(Bolsa_sem_pontos);
OUTPUT(Socios_sem_pontos);
OUTPUT(Socios_Bolsa);
OUTPUT(COUNT(Socios_Bolsa));



