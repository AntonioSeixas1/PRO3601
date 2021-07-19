IMPORT $,STD;

Trab_Escravo := $.File_Trabalho_Escravo.File;
profileResults := STD.DataPatterns.Profile(Trab_Escravo);

OUTPUT(profileResults);
