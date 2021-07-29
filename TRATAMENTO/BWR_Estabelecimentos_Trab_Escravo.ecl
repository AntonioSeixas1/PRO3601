IMPORT $;
IMPORT $.^.FILES.trab_escravos_files as TE;
IMPORT STD;

Estabelecimentos := $.File_Estabelecimentos_opt.File;
Trab_Escravo_S := SORT(TE.File_Trab_Escravo_Opt.File, CNPJ);					

Layout_Trab_Escravo := RECORD
		STRING14 CNPJ := STD.Str.FilterOut(Trab_Escravo_S.CNPJ, '*.-/');
    Trab_Escravo_S;
END;

Trab_Escravo_F := TABLE(Trab_Escravo_S , Layout_Trab_Escravo);

Estabelecimentos_Trab_Escravo := JOIN(Estabelecimentos, Trab_Escravo_F, RIGHT.cnpj = LEFT.CNPJ);
																 
																 
OUTPUT(Estabelecimentos_Trab_Escravo,, '~grupo7::Estabelecimentos_TrabEscravo', NAMED('Estabelecimentos_TrabEscravo'));
