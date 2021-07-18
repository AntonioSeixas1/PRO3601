EXPORT file_socio1 := MODULE
 EXPORT Layout := RECORD 
    STRING8 field1;
    UNSIGNED1 field2;
    STRING149 field3;
    STRING14 field4;
    STRING2 field5;
    UNSIGNED4 field6;
    STRING3 field7;
    STRING11 field8;
    STRING60 field9;
    STRING2 field10;
    UNSIGNED1 field11;
 END;
 //YOUR initials between CLASS and Intro:
 EXPORT File := DATASET('~grupo7::socios_1',Layout,CSV);
END;


