Tabela := $.File_Natureza_Juridica.file;

Layout_Natureza_Juridica := RECORD
	Codigo:= Empresas.NATUREZA_JURIDICA;
	Contagem := COUNT(GROUP);
END;


Natureza_Juridica := TABLE( Empresas, Layout_Natureza_Juridica, NATUREZA_JURIDICA);

Natureza_Juridica_j := JOIN(Natureza_Juridica, Tabela, (STRING)LEFT.Codigo = RIGHT.Codigo);


OUTPUT(Natureza_Juridica_s, NAMED('Natureza_Juridica'));