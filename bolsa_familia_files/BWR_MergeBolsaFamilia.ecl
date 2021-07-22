IMPORT $,STD;

E1 := $.File_BolsaFamilia_1.File;
E2 := $.File_BolsaFamilia_2.File;
E3 := $.File_BolsaFamilia_3.File;
E4 := $.File_BolsaFamilia_4.File;
E5 := $.File_BolsaFamilia_5.File;
E6 := $.File_BolsaFamilia_6.File;

E1_s := SORT(E1, NOME_FAVORECIDO, CPF_FAVORECIDO);
E2_s := SORT(E2, NOME_FAVORECIDO,CPF_FAVORECIDO);
E3_s := SORT(E3, NOME_FAVORECIDO,CPF_FAVORECIDO);
E4_s := SORT(E4, NOME_FAVORECIDO,CPF_FAVORECIDO);
E5_s := SORT(E5, NOME_FAVORECIDO,CPF_FAVORECIDO);
E6_s := SORT(E6, NOME_FAVORECIDO,CPF_FAVORECIDO);


Bolsa := MERGE(E1_s, E2_s, E3_s, E4_s, E5_s, E6_s, SORTED(NOME_FAVORECIDO, CPF_FAVORECIDO));

OUTPUT(Bolsa,, '~grupo7::bolsa_familia', OVERWRITE);