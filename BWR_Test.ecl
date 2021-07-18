IMPORT $,STD;

Persons := $.File_Test.File;
profileResults := STD.DataPatterns.Profile(Persons);

OUTPUT(profileResults);
