IMPORT STD;

Rec := RECORD,MAXLENGTH(4096)
  STRING4  Letter;
  UNSIGNED1    DS;
  UNSIGNED1    Matches   := 0;
  UNSIGNED1    LastMatch := 0;
  SET OF UNSIGNED1 MatchDSs  := [];
END;

ds1 := DATASET([{'AHI',1},{'B',1},{'C',1},{'D',1},{'E',1}],Rec);
ds2 := DATASET([{'A',2},{'B',2},{'H',2},{'I',2},{'J',2}],Rec);
ds3 := DATASET([{'B',3},{'C',3},{'M',3},{'N',3},{'O',3}],Rec);
ds4 := DATASET([{'A',4},{'B',4},{'R',4},{'S',4},{'T',4}],Rec);
ds5 := DATASET([{'B',5},{'V',5},{'W',5},{'X',5},{'Y',5}],Rec);

rec transf(Rec Le, Rec Ri) := TRANSFORM
	SELF := Le;
END;


RT_folk := JOIN(ds1,
                ds2,
                STD.Str.Contains(LEFT.Letter, RIGHT.Letter,false),
                transf(LEFT, RIGHT), ALL);

OUTPUT(RT_folk);