IMPORT $;

EXPORT DenormEmpresasSocios := MODULE
    // Defina os dois datasets a serem aninhados
    EXPORT Empresas := $.File_MergedEmpresas.File;
    // EXPORT CrimeRecs := $.File_Crime_Slim.File;
    EXPORT Socios_beneficios := $.File_Socios_Beneficios.File;
    // Defina estrutura de saÃ­da
    EXPORT Layout_Empresas_Socios := RECORD
        Empresas;
        UNSIGNED1 Quantidade_de_Socios;
        DATASET(RECORDOF(Socios_beneficios)) Socios_com_beneficios;
    END;
    // Popule os pais
    Layout_Empresas_Socios ParentMove(RECORDOF(Empresas) Le) := TRANSFORM
        SELF.Quantidade_de_Socios := 0;
        SELF.Socios_com_beneficios := [];
        SELF := Le;
    END;
    
    ParentOnly := PROJECT(Empresas, ParentMove(LEFT));
    // Popule os filhos
    Layout_Empresas_Socios ChildMove(Layout_Empresas_Socios Le, RECORDOF(Socios_beneficios) Ri, INTEGER Cnt):= TRANSFORM
        SELF.Quantidade_de_Socios := Cnt;
        SELF.Socios_com_beneficios := Le.Socios_com_beneficios + Ri;
        SELF := Le;
    END;
    
    EXPORT File := DENORMALIZE(ParentOnly, Socios_beneficios,
        LEFT.CNPJ_BASICO = (UNSIGNED) RIGHT.CNPJ_BASICO, ChildMove(LEFT,RIGHT,COUNTER)):PERSIST('~grupo7::DenormES');
END;