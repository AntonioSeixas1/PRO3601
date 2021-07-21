IMPORT $, STD;

Socios_Bolsa := $.File_Socios_bolsa;
Socios_Auxilio := $.File_Socios_auxilio;

Rec_SociosComBeneficios := RECORD
	Socios_Auxilio.file;
END;


// TRANSFORM para fazer o JOIN
Rec_SociosComBeneficios transf(Socios_Auxilio.Layout Le, Socios_Bolsa.Layout Ri) := TRANSFORM
	Self.NOME_SOCIO_RAZAO_SOCIAL := Le.NOME_SOCIO_RAZAO_SOCIAL;
	Self.CPF_MASC_SOCIO :=Le.CPF_MASC_SOCIO;
	Self.QUALIFICACAO_SOCIO :=Le.QUALIFICACAO_SOCIO;
	Self.FAIXA_ETARIA :=Le.FAIXA_ETARIA;
	Self.CNPJ_BASICO :=Le.CNPJ_BASICO;
    Self.UF :=Le.UF;
    Self.Observacao_do_Auxilio_Emergencial :=Le.Observacao_do_Auxilio_Emergencial;
	SELF.Beneficio := if((Le.Beneficio = 1) and (Ri.Beneficio = 2), 3, if(Le.Beneficio = 1, 1, 2));
END;

// JOIN DATABASE
Socios_beneficio := JOIN(Socios_auxilio.file,
                Socios_bolsa.file ,
                LEFT.CPF_MASC_SOCIO = RIGHT.CPF_MASC_SOCIO AND LEFT.NOME_SOCIO_RAZAO_SOCIAL = RIGHT.NOME_SOCIO_RAZAO_SOCIAL,
                transf(LEFT, RIGHT), FULL OUTER);

OUTPUT(Socios_beneficio)