IMPORT $,STD;

Socios := $.file_socio1.file;
profileResults := STD.DataPatterns.Profile(Socios );

OUTPUT(profileResults);
