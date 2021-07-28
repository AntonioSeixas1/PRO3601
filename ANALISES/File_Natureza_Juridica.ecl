EXPORT File_Natureza_Juridica := MODULE

	EXPORT  Layout := RECORD
    STRING4 Codigo;
    STRING72 Nome_Natureza_Juridica;
	END;

EXPORT File := DATASET('~grupo7::natjud',Layout,CSV);
END;
