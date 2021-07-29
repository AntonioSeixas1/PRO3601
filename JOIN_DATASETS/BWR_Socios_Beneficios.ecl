IMPORT $, STD;

Socios_Bolsa := $.File_Socios_bolsa;
Socios_Auxilio := $.File_Socios_auxilio;
Socios := $.File_MergedSocios;

Rec_SociosComBeneficios := RECORD
	Socios_Auxilio.file;
END;

// TRANSFORM para fazer o JOIN
Rec_SociosComBeneficios transf(Socios_Auxilio.Layout Le, Socios_Bolsa.Layout Ri) := TRANSFORM
	
	Self.NOME_SOCIO_RAZAO_SOCIAL := if(Le.NOME_SOCIO_RAZAO_SOCIAL <> '',  Le.NOME_SOCIO_RAZAO_SOCIAL, Ri.NOME_SOCIO_RAZAO_SOCIAL);
	Self.CPF_MASC_SOCIO := if(Le.CPF_MASC_SOCIO <> '', Le.CPF_MASC_SOCIO, Ri.CPF_MASC_SOCIO);
	Self.QUALIFICACAO_SOCIO := if(Le.QUALIFICACAO_SOCIO <> '', Le.QUALIFICACAO_SOCIO, Ri.QUALIFICACAO_SOCIO);
	Self.FAIXA_ETARIA := if((STRING1) Le.FAIXA_ETARIA <> '', Le.FAIXA_ETARIA, Ri.FAIXA_ETARIA);
	Self.CNPJ_BASICO := if(Le.CNPJ_BASICO <> '', Le.CNPJ_BASICO, Ri.CNPJ_BASICO);
  	Self.UF := if(Le.UF <> '', Le.uf, Ri.UF); 
  	Self.Observacao_do_Auxilio_Emergencial :=Le.Observacao_do_Auxilio_Emergencial;
	SELF.Beneficio := if((Le.Beneficio = 1) and (Ri.Beneficio = 2), 3, if(Le.Beneficio = 1, 1, 2));
END;

// JOIN DATABASE
Socios_beneficio := JOIN(Socios_auxilio.file,
                Socios_bolsa.file ,
                LEFT.NOME_SOCIO_RAZAO_SOCIAL = RIGHT.NOME_SOCIO_RAZAO_SOCIAL AND LEFT.CPF_MASC_SOCIO = RIGHT.CPF_MASC_SOCIO AND LEFT.CNPJ_BASICO = RIGHT.CNPJ_BASICO,
                transf(LEFT, RIGHT), FULL OUTER);

// OUTPUT Socios
OUTPUT(Socios_beneficio,, '~grupo7::Socios_Beneficios', OVERWRITE, NAMED('Socios_com_Beneficio'));