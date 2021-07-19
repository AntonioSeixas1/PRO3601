﻿EXPORT File_Estab_9 := MODULE
 EXPORT Layout := RECORD 
 
    STRING8 CNPJ_Basico;
    STRING4 CNPJ_Ordem;
    STRING2 CNPJ_DV;
    UNSIGNED1 Identificador_Matriz_Filial;
		STRING55 Nome_Fantasia;
    STRING2 SITUACAO_CADASTRAL;
    UNSIGNED4 DATA_SITUACAO_CADASTRAL;
    STRING2 MOTIVO_SITUACAO_CADASTRAL;
    STRING31 NOME_DA_CIDADE_NO_EXTERIOR;
    STRING3 PAIS;
    UNSIGNED4 DATA_DE_INICIO_ATIVIDADE;
    STRING7 CNAE_FISCAL_PRINCIPAL;
    STRING791 CNAE_FISCAL_SECUNDARIA;
    STRING20 TIPO_DE_LOGRADOURO;
    STRING60 LOGRADOURO;
    STRING6 NUMERO;
    STRING156 COMPLEMENTO;
    STRING50 BAIRRO;
    STRING8 CEP;
    STRING2 UF;
    STRING4 MUNICIPIO;
    STRING4 DDD_1;
    STRING8 TELEFONE_1;
    STRING4 DDD_2;
    STRING8 TELEFONE_2;
    STRING4 DDD_DO_FAX;
    STRING8 FAX;
    STRING106 CORREIO_ELETRONICO;
    STRING20 SITUACAO_ESPECIAL;
    UNSIGNED4 DATA_DA_SITUACAO_ESPECIAL;
		
END;
 //YOUR initials between CLASS and Intro:
 EXPORT File := DATASET('~grupo7::estab_9',Layout,CSV);
END;