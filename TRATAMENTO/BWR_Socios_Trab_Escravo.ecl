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

Socios_F := TABLE(Socios(STD.Str.FilterOut(Socios.cnpj_cpf_socio, '*.-') <> ''), Layout_Socios_Filtrado);
//Socios_S := SORT(Socios, nome_socio_razao_social);

Trab_Escravo_S := SORT(Trab_Escravo, Empregador, cpf);

//JOIN com Nome e CPF
Socios_Trab_Escravo_NOME_CPF := JOIN(Trab_Escravo_S, 
														Socios_F,
														LEFT.Empregador = RIGHT.nome_socio_razao_social AND STD.Str.FilterOut(LEFT.cpf, '*.-')[4..9] = RIGHT.cpf_socios);

Layout_S_TE_Filtrado := RECORD
	Socios_Trab_Escravo_NOME_CPF.Empregador;
	Socios_Trab_Escravo_NOME_CPF.cpf;
	Socios_Trab_Escravo_NOME_CPF.cnpj_basico;
	Socios_Trab_Escravo_NOME_CPF.trabalhadores_envolvidos;
	Socios_Trab_Escravo_NOME_CPF.uf;
	Socios_Trab_Escravo_NOME_CPF.ano_da_acao_fiscal;
	Socios_Trab_Escravo_NOME_CPF.cnae;
	Socios_Trab_Escravo_NOME_CPF.qualificacao_socio;
	Socios_Trab_Escravo_NOME_CPF.faixa_etaria;
END;

Socios_Trab_Escravo_NOME_CPF_F := TABLE(Socios_Trab_Escravo_NOME_CPF, Layout_S_TE_Filtrado);

OUTPUT(Socios_Trab_Escravo_NOME_CPF_F,, '~grupo7::Socios_Trab_Escravo', OVERWRITE, NAMED('JOIN_S_TE_NOME_CPF')); //101 casos

DeDupSocios_Trab_Escravo := DEDUP(Socios_trab_Escravo_NOME_CPF, LEFT.Empregador = RIGHT.Empregador);

//Pegando apenas um Empregador para análise de Sócios - descartando a análise de empresas
OUTPUT(DeDupSocios_Trab_Escravo,, '~grupo7::DEDUP_Socios_Trab_Escravo', OVERWRITE, NAMED('DEDUP_SOCIOS_TE'));