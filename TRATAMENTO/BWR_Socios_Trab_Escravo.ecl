IMPORT $.^.MERGE as M;
IMPORT $.^.trab_escravos_files as TE;
IMPORT STD;

Socios := M.File_MergedSocios.File;
Trab_Escravo := TE.File_Trabalho_Escravo.File;

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

//Trabalho Escravo Filtrado e Ordenado:
Layout_Trab_Escravo_Filtered := RECORD
	Trab_Escravo.ano_da_acao_fiscal;
	Trab_Escravo.UF;
	Empregador := STD.Str.ToUpperCase(STD.Str.FindReplace(Trab_Escravo.Empregador, 'Ã¡', 'A'));
	CNPJ := IF(STD.Str.Contains(Trab_Escravo.CNPJ_CPF, '/', False), Trab_Escravo.CNPJ_CPF, '');
	CPF := IF(STD.Str.Contains(Trab_Escravo.CNPJ_CPF, '/', False), '', Trab_Escravo.CNPJ_CPF);
	Trab_Escravo.Estabelecimento;
	Trab_Escravo.Trabalhadores_Envolvidos;
	Trab_Escravo.CNAE;
	Trab_Escravo.decisao_administrativa_de_procedencia_irrecorribilidade;
	Trab_Escravo.inclusao_no_cadastro_de_empregadores;
END;

Trab_Escravo_F := TABLE(Trab_Escravo, Layout_Trab_Escravo_Filtered);

Trab_Escravo_S := SORT(Trab_Escravo_F, Empregador);

OUTPUT(Trab_Escravo_S, NAMED('Trab_Escravo'));

//JOIN 
Socios_Trab_Escravo := JOIN(Trab_Escravo_S, 
														Socios_S,
														LEFT.Empregador = RIGHT.nome_socio_razao_social);
														

OUTPUT(Socios_Trab_Escravo, NAMED('JOIN_S_TE'));
//OUTPUT(COUNT(Socios_Trab_Escravo.Empregador), NAMED('Contagem_de_casos'));

//JOIN com cnpj
//Socios_Trab_Escravo_CNPJ := JOIN(Trab_Escravo_S, 
//																 Socios_S,
//																 IF(STD.Str.Contains(STD.Str.FilterOut(LEFT.cnpj, '*.-/'), RIGHT.cnpj_basico, NOCASE)) = TRUE);
																 
//OUTPUT(Socios_Trab_Escravo_CNPJ, NAMED('JOIN_CNPJ_S_TE'));