IMPORT $,STD;

QualSocios := $.File_Qualificacao_Socios.File;
profileResults := STD.DataPatterns.Profile(QualSocios);

OUTPUT(profileResults);
