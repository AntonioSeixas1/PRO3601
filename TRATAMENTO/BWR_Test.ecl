IMPORT $;

Socios := $.File_Socios_Beneficios.File;

//OUTPUT(Socios(nome_socio_razao_social = 'ALTAIR ANTONIO COSTA'));

OUTPUT(SORT($.DenormEmpresasSocios.File(quantidade_de_socios>0), -quantidade_de_socios),, '~grupo7::socios_empresas', OVERWRITE);

