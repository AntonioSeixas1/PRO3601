﻿EXPORT file_socio3 := MODULE
 EXPORT Layout := RECORD 
   STRING8 CNPJ_BASICO;
    UNSIGNED1 INDENTIFICADOR_DE_SOCIO;
    STRING149 NOME_SOCIO_RAZAO_SOCIAL;
    STRING14 CNPJ_CPF_SOCIO;
    STRING2 QUALIFICACAO_SOCIO;
    UNSIGNED4 DATA_DE_ENTRADA;
    STRING3 PAIS;
    STRING11 REPRESENTANTE_LEGAL;
    STRING60 NOME_DO_REPRESENTANTE;
    STRING2 QUALIFICACAO_REPRESENTANTE;
    UNSIGNED1 FAIXA_ETARIA;
 END;
 //YOUR initials between CLASS and Intro:
 EXPORT File := DATASET('~grupo7::socios_3',Layout,CSV);
END;


