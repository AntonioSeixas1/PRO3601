IMPORT $;

Qualificacoes := $.File_Qualificacao_Socios.File;
Empresas := $.File_MergedEmpresas.File;
Socios_Beneficios := $.File_Socios_Beneficios.File;


// DATABASE Empresas
// Removendo os registros cujo CNPJ não está informado e retirando campos inúteis 
Layout_Empresas_Filtered := RECORD
	Empresas.CNPJ_BASICO;
	Empresas.RAZAO_SOCIAL;
	Empresas.NATUREZA_JURIDICA;
	Empresas.CAPITAL_SOCIAL_DA_EMPRESA;
	Empresas.PORTE_DA_EMPRESA;
END;

Empresas_F := TABLE(Empresas, Layout_Empresas_Filtered);

// DATABASE Socios_Beneficios
Socios_Ben_S := SORT(Socios_Beneficios, CNPJ_BASICO);

// JOIN DATABASE
Socios_Beneficios_Empresas := JOIN(Empresas_F,
																	 Socios_Ben_S,
																	 LEFT.CNPJ_BASICO = (UNSIGNED)RIGHT.CNPJ_BASICO);


Layout_por_Qual_Idade := RECORD
    Codigo_Qualificacao := Socios_Beneficios_Empresas.QUALIFICACAO_SOCIO;
		Faixa_Etaria := Socios_Beneficios_Empresas.faixa_etaria;
    Contagem := COUNT(GROUP);
END;


Por_Qualificacao_Idade := TABLE(Socios_Beneficios_Empresas, Layout_por_Qual_Idade, QUALIFICACAO_SOCIO, faixa_etaria);

Por_Qualificacao_Idade_J := JOIN(Por_Qualificacao_Idade,
																	 Qualificacoes,
																	 LEFT.Codigo_Qualificacao = RIGHT.CODIGO);

OUTPUT(Por_Qualificacao_Idade_J  , NAMED('Por_Qualificacao_Idade'));