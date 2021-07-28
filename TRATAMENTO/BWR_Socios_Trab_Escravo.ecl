IMPORT $.^.JOIN_DATASETS as JD;
IMPORT $.^.FILES.trab_escravos_files as TE;
IMPORT STD;

Socios := JD.File_MergedSocios.File;
Trab_Escravo := TE.File_Trab_Escravo_Opt.File;							

//Socios:
Layout_Socios_Filtrado := RECORD
	Socios.cnpj_basico;
	Socios.nome_socio_razao_social;
	cpf_socios := STD.Str.FilterOut(Socios.cnpj_cpf_socio, '*.-');
	Socios.qualificacao_socio;
	cpf_representante_legal := STD.Str.FilterOut(Socios.representante_legal, '*.-');
	Socios.nome_do_representante;
	Socios.qualificacao_representante;
	Socios.faixa_etaria;
END;

Socios_F := TABLE(Socios, Layout_Socios_Filtrado);

//Socios_S := SORT(Socios, nome_socio_razao_social);


//OUTPUT(Socios_Trab_Escravo, NAMED('JOIN_S_TE'));

Trab_Escravo_S_CPF := SORT(Trab_Escravo, cpf);
Socios_S_CPF := SORT(Socios_F, cpf_socios);

//JOIN com cnpj
Socios_Trab_Escravo_CNPJ := JOIN(Socios_S_CPF,
																 Trab_Escravo_S_CPF,
																 STD.Str.FilterOut(STD.STr.SplitWords(RIGHT.cnpj, '/')[1], '*.-') = LEFT.cnpj_basico);
																 
																 
//STD.Str.FilterOut(RIGHT.cnpj, '*.-')																 
OUTPUT(Socios_Trab_Escravo_CNPJ, NAMED('JOIN_CNPJ_S_TE'));