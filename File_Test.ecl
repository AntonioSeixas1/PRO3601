EXPORT File_Test := MODULE
 EXPORT Layout := RECORD 
	
    STRING C1;
		STRING C2;
		 STRING C3;
		STRING C4;
		 STRING C5;
		STRING C6;
		 STRING C7;
 
 END;
 //YOUR initials between CLASS and Intro:
 EXPORT File := DATASET('~grupo7::empresa_1',Layout,CSV);
END;
