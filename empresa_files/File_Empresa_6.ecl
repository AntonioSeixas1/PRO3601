﻿EXPORT File_Empresa_6 := MODULE
 EXPORT Layout := RECORD 
	
    UNSIGNED4	 CNPJ_BASICO;
		STRING150 RAZAO_SOCIAL;
		UNSIGNED2 NATUREZA_JURIDICA;
		STRING2 QUALIFICACAO_DO_RESPONSAVEL;
		STRING15 CAPITAL_SOCIAL_DA_EMPRESA;
		STRING2 PORTE_DA_EMPRESA;
		STRING32 ENTE_FEDERATIVO_RESPONSAVEL

 END;
 //YOUR initials between CLASS and Intro:
 EXPORT File := DATASET('~grupo7::empresa_6',Layout,CSV);
END;
