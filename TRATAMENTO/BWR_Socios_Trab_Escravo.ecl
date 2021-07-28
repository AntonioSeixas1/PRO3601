IMPORT $.^.MERGE as M;
IMPORT $.^.trab_escravos_files as TE;
IMPORT STD;

Socios := M.File_MergedSocios.File;
Trab_Escravo := TE.File_Trab_Escravo_Opt.File;

OUTPUT(Trab_Escravo);

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
Socios_S := SORT(Socios_F, nome_socio_razao_social);

Trab_Escravo_S := SORT(Trab_Escravo, Empregador);

//JOIN 
Socios_Trab_Escravo := JOIN(Trab_Escravo_S, 
														Socios_S,
														LEFT.Empregador = RIGHT.nome_socio_razao_social);
														

//OUTPUT(Socios_Trab_Escravo, NAMED('JOIN_S_TE'));

Trab_Escravo_S_CNPJ := SORT(Trab_Escravo_S, cnpj);
Socios_S_CNPJ := SORT(Socios_S, cnpj_basico);

//JOIN com cnpj
Socios_Trab_Escravo_CNPJ := JOIN(Trab_Escravo_S_CNPJ, 
																 Socios_S_CNPJ,
																 STD.Str.Contains(STD.Str.FilterOut(LEFT.cnpj, '*.-/'), RIGHT.cnpj_basico, TRUE), ALL);
																 
OUTPUT(Socios_Trab_Escravo_CNPJ, NAMED('JOIN_CNPJ_S_TE'));