IMPORT $,STD;

E1 := $.File_empresa_1.File;
E2 := $.File_empresa_2.File;
E3 := $.File_empresa_3.File;
E4 := $.File_empresa_4.File;
E5 := $.File_empresa_5.File;
E6 := $.File_empresa_6.File;
E7 := $.File_empresa_7.File;
E8 := $.File_empresa_8.File;
E9 := $.File_empresa_9.File;
E10 := $.File_empresa_10.File;

E1_s := SORT(E1, E1.CNPJ_BASICO);
E2_s := SORT(E2, E2.CNPJ_BASICO);
E3_s := SORT(E3, E3.CNPJ_BASICO);
E4_s := SORT(E4, E4.CNPJ_BASICO);
E5_s := SORT(E5, E5.CNPJ_BASICO);
E6_s := SORT(E6, E6.CNPJ_BASICO);
E7_s := SORT(E7, E7.CNPJ_BASICO);
E8_s := SORT(E8, E8.CNPJ_BASICO);
E9_s := SORT(E9, E9.CNPJ_BASICO);
E10_s := SORT(E10, E10.CNPJ_BASICO);


Empresas := MERGE(E1_s, E2_s, E3_s, E4_s, E5_s, E6_s, E7_s, E8_s, E9_s, E10_s, SORTED(CNPJ_BASICO));

OUTPUT(Empresas,, '~grupo7::empresas');