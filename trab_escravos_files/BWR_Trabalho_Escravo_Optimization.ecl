IMPORT $,STD;

Trab_Escravo := $.File_Trabalho_Escravo.File;
profileResults := STD.DataPatterns.Profile(Trab_Escravo);

//OUTPUT(profileResults);
OUTPUT(Trab_Escravo,, '~grupo7::trabalho_escravo_opt', OVERWRITE);