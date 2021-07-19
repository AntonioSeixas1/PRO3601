IMPORT $,STD;

E1 := $.File_AuxilioEmergencial202101.File;
E2 := $.File_AuxilioEmergencial202102.File;
E3 := $.File_AuxilioEmergencial202103.File;
E4 := $.File_AuxilioEmergencial202104.File;
E5 := $.File_AuxilioEmergencial202105.File;
E6 := $.File_AuxilioEmergencial202106.File;


E1_s := SORT(E1, E1.CPF_Beneficiario);
E2_s := SORT(E2, E2.CPF_Beneficiario);
E3_s := SORT(E3, E3.CPF_Beneficiario);
E4_s := SORT(E4, E4.CPF_Beneficiario);
E5_s := SORT(E5, E5.CPF_Beneficiario);
E6_s := SORT(E6, E6.CPF_Beneficiario);


Dados_Auxilio:= MERGE(E1_s, E2_s, E3_s, E4_s, E5_s, E6_s, SORTED(CPF_Beneficiario));

OUTPUT(Dados_Auxilio,,'~grupo7::auxilios');