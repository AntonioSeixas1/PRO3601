IMPORT $,STD;

E1 := $.file_socio1.File;
E2 := $.file_socio2.File;
E3 := $.file_socio3.File;
E4 := $.file_socio4.File;
E5 := $.file_socio5.File;
E6 := $.file_socio6.File;
E7 := $.file_socio7.File;
E8 := $.file_socio8.File;
E9 := $.file_socio9.File;
E10 := $.file_socio10.File;

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


Socios := MERGE(E1_s, E2_s, E3_s, E4_s, E5_s, E6_s, E7_s, E8_s, E9_s, E10_s, SORTED(CNPJ_BASICO));

//OUTPUT(COUNT(E1) + COUNT(E2) + COUNT(E3) + COUNT(E4) + COUNT(E5) + COUNT(E6) + COUNT(E7) + COUNT(E8) + COUNT(E9) +COUNT(E10) )

OUTPUT(Socios,, '~grupo7::socios');