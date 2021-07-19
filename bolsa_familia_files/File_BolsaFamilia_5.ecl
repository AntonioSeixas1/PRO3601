EXPORT File_BolsaFamilia_5 := MODULE
 EXPORT Layout := RECORD 
	
    unsigned3 MES_REFERENCIA;
    unsigned3 MES_COMPETENCIA;
    string2 UF;
    string4 CODIGO_MUNICIPIO_SIAFI;
    string40 NOME_MUNICIPIO;
    string14 CPF_FAVORECIDO;
    unsigned6 NIS_FAVORECIDO;
    string69 NOME_FAVORECIDO;
    string7 VALOR_PARCELA;

 END;
 //YOUR initials between CLASS and Intro:
 EXPORT File := DATASET('~grupo7::202105_bolsafamilia_pagamentos',Layout,CSV(heading(1)));
END;
