IMPORT $,STD;

E1 := $.File_BolsaFamilia_1.File;
E2 := $.File_BolsaFamilia_2.File;
E3 := $.File_BolsaFamilia_3.File;
E4 := $.File_BolsaFamilia_4.File;
E5 := $.File_BolsaFamilia_5.File;
E6 := $.File_BolsaFamilia_6.File;

E1_s := SORT(E1, E1.CPF_FAVORECIDO);
E2_s := SORT(E2, E2.CPF_FAVORECIDO);
E3_s := SORT(E3, E3.CPF_FAVORECIDO);
E4_s := SORT(E4, E4.CPF_FAVORECIDO);
E5_s := SORT(E5, E5.CPF_FAVORECIDO);
E6_s := SORT(E6, E6.CPF_FAVORECIDO);


Bolsa := MERGE(E1_s, E2_s, E3_s, E4_s, E5_s, E6_s, SORTED(CPF_FAVORECIDO));

OUTPUT(Bolsa,, '~grupo7::bolsa_familia', OVERWRITE);