EXPORT File_AuxilioEmergencial := MODULE
 EXPORT Layout := RECORD 

    UNSIGNED3 Mes_disponibilizacao;
		STRING2 UF;
		UNSIGNED4 Codigo_municipio;
		STRING30 Nome_municipio;
		STRING11 NIS_beneficiario;
		STRING14 CPF_beneficiario;
		STRING49 Nome_beneficiario;
    INTEGER6 NIS_responsavel;
		STRING14 CPF_responsavel;
		STRING45 Nome_responsavel;
		STRING13 Enquadramento;
		STRING2 Parcela;
		STRING32 Observacao;
		STRING7 Valor_beneficio;
 
 END;
 //YOUR initials between CLASS and Intro:
 EXPO
Vitor Nascimento Paixao21:23
EXPORT File := DATASET('~grupo7::202105_auxilioemergencial',Layout,CSV(HEADING(1)));
END;