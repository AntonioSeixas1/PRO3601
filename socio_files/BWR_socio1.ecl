IMPORT $,STD;

Persons := $.file_socio1.file;
profileResults := STD.DataPatterns.Profile(Persons);

OUTPUT(profileResults);