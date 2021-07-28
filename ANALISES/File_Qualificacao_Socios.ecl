EXPORT file_Qualificacao_Socios := MODULE
 EXPORT Layout := RECORD 
    STRING2 Codigo;
		STRING69 Qualificacao;
 END;
 //YOUR initials between CLASS and Intro:
 EXPORT File := DATASET('~grupo7::qualificacao_socios',Layout,CSV);
END;


