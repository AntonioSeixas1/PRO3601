IMPORT $.^.JOIN_DATASETS as JD;
IMPORT $.^.FILES.trab_escravos_files as TE;
IMPORT STD;

Socios_Completo := JD.File_MergedSocios.File;
Trab_Escravo := TE.File_Trab_Escravo_Opt.File;

Layout_Empresas_do_Socio := RECORD
	STRING14 CNPJ_CPF_SOCIO;
	STRING8 CNPJ_BASICO;
	STRING3 PAIS;
	UNSIGNED1 FAIXA_ETARIA;
END;

Layout_Empresas_do_Socio SoEmpresas(RECORDOF(Socios_Completo) Le) := TRANSFORM
	SELF := Le;
END;

Socios := PROJECT(Socios_Completo, SoEmpresas(LEFT));

//OUTPUT(Socios);

// Defina estrutura de saida
Layout_TrabEscravo_Socios := RECORD
        Trab_Escravo;
        DATASET(RECORDOF(Socios)) Socios;
END;
    // Popule os pais
Layout_TrabEscravo_Socios ParentMove(RECORDOF(Trab_Escravo) Le) := TRANSFORM
        SELF.Socios := [];
        SELF := Le;
END;
    
ParentOnly := PROJECT(Trab_Escravo, ParentMove(LEFT));

// Popule os filhos
Layout_TrabEscravo_Socios ChildMove(Layout_TrabEscravo_Socios Le, RECORDOF(Socios) Ri):= TRANSFORM
        SELF.Socios := Le.Socios + Ri;
        SELF := Le;
END;
    
File := DENORMALIZE(ParentOnly, Socios,
        STD.Str.FilterOut(LEFT.cpf, '*.-')[4..9] = STD.Str.FilterOut(RIGHT.cnpj_cpf_socio, '*.-'), 
				ChildMove(LEFT,RIGHT));

OUTPUT(File);


