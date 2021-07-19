IMPORT $,STD;

Estab := $.File_Estab_1.File;
profileResults := STD.DataPatterns.Profile(Estab);

OUTPUT(profileResults);
