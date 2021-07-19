IMPORT $,STD;

Persons := $.File_BolsaFamilia.File;
// profileResults := STD.DataPatterns.Profile(Persons);

p1 := SORTED(Persons, Persons.mes_referencia);

pp := MERGE(p1, p1, SORTED(mes_referencia));

OUTPUT(COUNT(pp));

OUTPUT(pp);




