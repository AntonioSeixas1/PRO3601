IMPORT $, STD;

Empresa := $.File_Empresa_2.File;

Empresa_s := SORT(Empresa, Empresa.CNPJ_BASICO);

OUTPUT(Empresa);