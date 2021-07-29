# PRO3601 - Grupo 7
Repositório para desenvolvimento do projeto da disciplina  PRO3601 - Análise Massiva de dados para gestão de operações

## Integrantes

- Antonio Lago Araújo Seixas - 11261110
- Bruno Carneiro Camara - 11257230
- Gustavo Castro dos Santos - 10336699
- Vitor Nascimento Paixão - 10823661


## Objetivo do projeto
Identificar preventivamente possíveis inconsistências cadastrais e/ou fraudes, localizando comportamentos suspeitos ou que gerem alguma  situação atípica de comportamento, e nesse sentido, levantar soluções que possam avaliar empresas e sócios a fim de detectar possíveis inconsistências e/ou tentativas de fraude.

## Base analisadas
- Bases de empresas Brasileiras:
  - Empresas
  - Sócios
  - Estabelecimentos


- Base de identificação de empregadores que tenham submetido trabalhadores a condições anàlogas à de escravidão

- Bolsas de subsídio do governo (de janeiro à junho de 2021):
  - Auxílio Emergencial
  - Bolsa Família

## Bases obtidas
- Socios_Beneficios_PorEmpresa: Tal base correlaciona cada sócio com suas respectivas empresas e indica quais benefícios governamentais se está usufruindo, sendo informado no campo "Benefícios". Neste campo, é utilizado a seguinte relação:
  - 1 -> Auxílio Emergencial
  - 2 -> Bolsa Família
  - 3 -> Bolsa Família e Auxílio Emergencial
- Estabelecimentos_TrabEscravo: Esta base correlaciona quais estabelicimentos foram denunciados por oferecer condições de trabalho análogas a escravidão.
- Socios_TrabEscravo: Esta base correlaciona quais sócios foram denunciados por oferecer condições de trabalho análogas a escravidão.

## Caminhos para cada base
- ECL Watch(já submetido)
  - Socios_Beneficios_PorEmpresa -> "grupo7::socios_beneficios_porempresa"
  - Estabelecimentos_TrabEscravo -> "grupo7::estabelecimentos_trabescravo"
  - Socios_TrabEscravo -> "grupo7::socios_trabescravo"
- Diretório Local(BWR's)
  - Socios_Beneficios_PorEmpresa -> PRO3601\JOIN_DATASETS\BWR_Socios_Beneficios.ecl
  - Estabelecimentos_TrabEscravo -> PRO3601\TRATAMENTO\BWR_Estabelecimentos_TrabEscravo.ecl
  - Socios_TrabEscravo -> PRO3601\TRATAMENTO\BWR_Socios_Trab_Escravo.ecl

 
