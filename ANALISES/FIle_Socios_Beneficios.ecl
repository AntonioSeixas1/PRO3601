﻿EXPORT File_Socios_Beneficios := MODULE
 EXPORT Layout := RECORD 

  STRING149 NOME_SOCIO_RAZAO_SOCIAL;
	STRING14 CPF_MASC_SOCIO;
	STRING2 QUALIFICACAO_SOCIO;
	UNSIGNED1 FAIXA_ETARIA;
	STRING8 CNPJ_BASICO;
  STRING2 UF;
  STRING32 Observacao_do_Auxilio_Emergencial;
	UNSIGNED1 Beneficio;

 END;
 //YOUR initials between CLASS and Intro:
EXPORT File := DATASET('~grupo7::socios_beneficios',Layout,FLAT);
END;