IMPORT $.^. JOIN_DATASETs as JD;

Tabela := $.File_Natureza_Juridica.file;
Empresas := JD.File_MergedEmpresas.file;

Total := COUNT(Empresas);
Total_F := COUNT( Empresas(NATUREZA_JURIDICA <> 2135 and NATUREZA_JURIDICA <> 4090));

Layout_Natureza_Juridica := RECORD
	Codigo:= Empresas.NATUREZA_JURIDICA;
	Contagem := COUNT(GROUP);
	Porcentagem_do_total := COUNT(GROUP)/Total*100;
END;

// 
Natureza_Juridica := TABLE( Empresas, Layout_Natureza_Juridica, NATUREZA_JURIDICA);

Natureza_Juridica_j := JOIN(Natureza_Juridica, Tabela, (STRING)LEFT.Codigo = RIGHT.Codigo);

Natureza_Juridica_s := SORT(Natureza_Juridica_j, -Contagem);

Layout_Natureza_Juridica_F := RECORD
	Codigo:= NATUREZA_JURIDICA_s.Codigo;
	Contagem := Natureza_Juridica_s.contagem;
	Porcentagem_do_total := NATUREZA_JURIDICA_s.Porcentagem_do_total*Total/Total_F;
	nome_natureza_juridica := Natureza_Juridica_s.nome_natureza_juridica; 
END;

Natureza_Juridica_F := TABLE( Natureza_Juridica_s( codigo <> 2135 and codigo <> 4090), Layout_Natureza_Juridica_F);

OUTPUT(Natureza_Juridica_s, NAMED('Natureza_Juridica_Total'));
OUTPUT(Natureza_Juridica_f, NAMED('Natureza_Juridica_Filtrado'));