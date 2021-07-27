IMPORT $,STD;

Empresa := $.File_Empresa_1.File;
profileResults := STD.DataPatterns.Profile(Empresa);

OUTPUT(profileResults);
