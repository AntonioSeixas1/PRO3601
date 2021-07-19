EXPORT File_Trabalho_Escravo := MODULE
 EXPORT Layout := RECORD 
 
    UNSIGNED1 ID;
    UNSIGNED2 Ano_da_acao_fiscal;
    STRING2 UF;
    STRING54 Empregador;
    STRING18 CNPJ_CPF;
    STRING126 Estabelecimento;
    UNSIGNED2 Trabalhadores_envolvidos;
    STRING9 CNAE;
    STRING10 Decisao_administrativa_de_procedencia_irrecorribilidade;
    STRING74 Inclusao_no_Cadastro_de_Empregadores;
		
END;
 //YOUR initials between CLASS and Intro:
 EXPORT File := DATASET('~grupo7::trabalho_escravo',Layout,CSV(heading(1)));
END;