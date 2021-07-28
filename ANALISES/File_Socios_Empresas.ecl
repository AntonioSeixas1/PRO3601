EXPORT file_Qualificacao_Socios := MODULE
 EXPORT layout := RECORD
   string149 nome_socio_razao_social;
   string14 cpf_masc_socio;
   string2 qualificacao_socio;
   unsigned1 faixa_etaria;
   string8 cnpj_basico;
   string2 uf;
   string32 observacao_do_auxilio_emergencial;
   unsigned1 beneficio;
  END;

RECORD
  unsigned4 cnpj_basico;
  string150 razao_social;
  unsigned2 natureza_juridica;
  string2 qualificacao_do_responsavel;
  string15 capital_social_da_empresa;
  string2 porte_da_empresa;
  string32 ente_federativo_responsavel;
  unsigned1 quantidade_de_socios;
  DATASET(layout) socios_com_beneficios;
 END;
 
 //YOUR initials between CLASS and Intro:
 EXPORT File := DATASET('~grupo7::socios_empresas',Layout,FLAT);
END;
