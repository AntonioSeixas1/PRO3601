IMPORT $.^.FILES.estabelecimento_files as EF;
IMPORT STD;

Estabelecimentos := EF.File_MergedEstabelecimentos.File;	

Layout_Estabelecimentos := RECORD
		STRING14 CNPJ := Estabelecimentos.CNPJ_Basico + Estabelecimentos.CNPJ_Ordem + Estabelecimentos.CNPJ_DV;
    Estabelecimentos.Identificador_Matriz_Filial;
		Estabelecimentos.Nome_Fantasia;
    Estabelecimentos.SITUACAO_CADASTRAL;
    Estabelecimentos.DATA_SITUACAO_CADASTRAL;
    Estabelecimentos.MOTIVO_SITUACAO_CADASTRAL;
		Estabelecimentos.DATA_DE_INICIO_ATIVIDADE;
    Estabelecimentos.PAIS;
		Estabelecimentos.UF;
END;

Estabelecimentos_F := TABLE(Estabelecimentos , Layout_Estabelecimentos);
Estabelecimentos_opt := SORT(Estabelecimentos_F, CNPJ);

OUTPUT(Estabelecimentos_opt,, '~grupo7::estabelecimentos_opt', OVERWRITE);