Tabela := $.File_Natureza_Juridica.file;
Empresas := $.File_MergedEmpresas.file;

Total := COUNT(Empresas);

Layout_Natureza_Juridica := RECORD
	Codigo:= Empresas.NATUREZA_JURIDICA;
	Contagem := COUNT(GROUP);
	Porcentagem_do_total := COUNT(GROUP)/Total*100;
END;


Natureza_Juridica := TABLE( Empresas, Layout_Natureza_Juridica, NATUREZA_JURIDICA);

Natureza_Juridica_j := JOIN(Natureza_Juridica, Tabela, (STRING)LEFT.Codigo = RIGHT.Codigo);

Natureza_Juridica_s := SORT(Natureza_Juridica_j, Natureza_Juridica_j.Contagem);


OUTPUT(Natureza_Juridica_s, NAMED('Natureza_Juridica'));