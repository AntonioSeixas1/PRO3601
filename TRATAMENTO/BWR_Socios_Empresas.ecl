IMPORT $,STD;

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
								
OUTPUT(Socios_Beneficios_Empresas,, '~grupo7::socios_beneficios_empresas', OVERWRITE, NAMED('JOIN_Socios_Empresas'));

Socios_Beneficios_Empresas_S := SORT(Socios_Beneficios_Empresas, NOME_SOCIO_RAZAO_SOCIAL);

OUTPUT(Socios_Beneficios_Empresas_S,,  NAMED('Join_Socios_Empresas_Sorted_By_Name'));