EXPORT File_Estabelecimentos_opt := MODULE
 EXPORT Layout := RECORD 
 
    STRING14 CNPJ;
    UNSIGNED1 Identificador_Matriz_Filial;
		STRING55 Nome_Fantasia;
    STRING2 SITUACAO_CADASTRAL;
    UNSIGNED4 DATA_SITUACAO_CADASTRAL;
    STRING2 MOTIVO_SITUACAO_CADASTRAL;
		UNSIGNED4 DATA_DE_INICIO_ATIVIDADE;
    STRING3 PAIS;
		STRING2 UF;
		
END;
 //YOUR initials between CLASS and Intro:
 EXPORT File := DATASET('~grupo7::estabelecimentos_opt',Layout, FLAT);
END;