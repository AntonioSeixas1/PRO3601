﻿IMPORT $,STD;

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

E1_s := SORT(E1, NOME_SOCIO_RAZAO_SOCIAL, CNPJ_CPF_SOCIO, CNPJ_BASICO);
E2_s := SORT(E2, NOME_SOCIO_RAZAO_SOCIAL, CNPJ_CPF_SOCIO, CNPJ_BASICO);
E3_s := SORT(E3, NOME_SOCIO_RAZAO_SOCIAL, CNPJ_CPF_SOCIO, CNPJ_BASICO);
E4_s := SORT(E4, NOME_SOCIO_RAZAO_SOCIAL, CNPJ_CPF_SOCIO, CNPJ_BASICO);
E5_s := SORT(E5, NOME_SOCIO_RAZAO_SOCIAL, CNPJ_CPF_SOCIO, CNPJ_BASICO);
E6_s := SORT(E6, NOME_SOCIO_RAZAO_SOCIAL, CNPJ_CPF_SOCIO, CNPJ_BASICO);
E7_s := SORT(E7, NOME_SOCIO_RAZAO_SOCIAL, CNPJ_CPF_SOCIO, CNPJ_BASICO);
E8_s := SORT(E8, NOME_SOCIO_RAZAO_SOCIAL, CNPJ_CPF_SOCIO, CNPJ_BASICO);
E9_s := SORT(E9, NOME_SOCIO_RAZAO_SOCIAL, CNPJ_CPF_SOCIO, CNPJ_BASICO);
E10_s := SORT(E10, NOME_SOCIO_RAZAO_SOCIAL, CNPJ_CPF_SOCIO);


Socios := MERGE(E1_s, E2_s, E3_s, E4_s, E5_s, E6_s, E7_s, E8_s, E9_s, E10_s, SORTED(NOME_SOCIO_RAZAO_SOCIAL, CNPJ_CPF_SOCIO, CNPJ_BASICO));

OUTPUT(Socios,, '~grupo7::socios', OVERWRITE);