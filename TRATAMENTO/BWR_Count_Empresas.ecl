IMPORT $, STD;

Empresas := $.File_MergedEmpresas.File;

// Quantidade por beneficio
Layout_por_CNPJ := RECORD
	CNPJ_BASICO := Empresas.CNPJ_BASICO;
	Contagem := COUNT(GROUP);
END;


Por_beneficio := TABLE(Empresas, Layout_por_CNPJ, CNPJ_BASICO);
OUTPUT(Empresas((STRING)CNPJ_BASICO >= '00000000') , NAMED('Por_Beneficio'));
OUTPUT(count(Por_beneficio(Contagem>1)) , NAMED('Contagem'));
