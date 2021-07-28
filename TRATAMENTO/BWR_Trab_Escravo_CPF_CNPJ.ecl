IMPORT $.^.trab_escravos_files AS TE;
IMPORT STD;

Trab_Escravo := TE.File_Trabalho_Escravo.File;

//OBS: No Empregador também há nomes de empresas, além de nomes de pessoas

//Separando em CPF e CNPJ em duas colunas duas colunas
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

//OBS: O Nome do Empregador está com letras acentuadas
//STD.Str.FindReplace(Trab_Escravo_F.Empregador, 'Á', 'A');
//STD.Str.FindReplace(Trab_Escravo_F.Empregador, 'Ã', 'A');
//STD.Str.FindReplace(Trab_Escravo_F.Empregador, 'É', 'E');
//STD.Str.FindReplace(Trab_Escravo_F.Empregador, 'Í', 'I');
//STD.Str.FindReplace(Trab_Escravo_F.Empregador, 'Ó', 'O');
//STD.Str.FindReplace(Trab_Escravo_F.Empregador, 'Ú', 'U');
//STD.Str.FindReplace(Trab_Escravo_F.Empregador, 'Ç', 'C');

OUTPUT(Trab_Escravo_F,, '~grupo7::trab_escravo_opt', OVERWRITE);
