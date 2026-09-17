-- Active: 1758067224005@@127.0.0.1@5432@bd_hortifruti@public

-- ============================================================
-- PRATICA 01: MINIMUNDO DE UM HORTIFRUTI
-- Sistemas de Banco de Dados I - UNIPAM
-- ============================================================

-- ============================================================
-- PARTE 2. BANCO DE DADOS, TABELA E CARGA NO POSTGRESQL
-- ============================================================

-- 2.1 Criacao do banco de dados
-- Executado uma unica vez, isoladamente, com a conexao ainda
-- apontando para bd_aula. Fica registrado aqui como comentario
-- porque nao pode ser executado a partir do proprio bd_hortifruti
-- (aula pratica 03, secao 3.2).

-- CREATE DATABASE bd_hortifruti;

-- 2.2 Criacao da tabela

DROP TABLE IF EXISTS itens_venda;

CREATE TABLE itens_venda (
    id             INTEGER       GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    venda_id       INTEGER       NOT NULL,
    data_venda     DATE          NOT NULL,
    bairro_entrega TEXT,
    produto_id     INTEGER       NOT NULL,
    produto_nome   TEXT          NOT NULL,
    categoria      TEXT          NOT NULL,
    unidade        TEXT          NOT NULL,
    quantidade     NUMERIC(10,3) NOT NULL,
    valor_unitario NUMERIC(10,2) NOT NULL
);

-- Justificativa dos tipos e das restricoes (regras do minimundo
-- entre parenteses):
--
-- quantidade NUMERIC(10,3): a balanca do caixa registra a massa com
-- precisao de um grama, ou seja, 0,001 kg (regra 5). A escala 3
-- cobre essa precisao. Os produtos vendidos por unidade tem
-- quantidade inteira (regra 5), mas convivem na mesma coluna com os
-- vendidos por Kg (regra 4); um unico NUMERIC(10,3) atende aos dois
-- casos, bastando que as quantidades inteiras fiquem com zeros nas
-- casas decimais. NOT NULL porque toda venda registra a quantidade
-- de cada item, sempre maior que zero (regra 7).
--
-- valor_unitario NUMERIC(10,2): valor monetario, em reais e
-- centavos, exigindo representacao decimal exata (regra 7; aula
-- pratica 03, secao 4.2). REAL ou DOUBLE PRECISION introduziriam
-- erro de arredondamento binario e sao reservados a grandezas
-- medidas, nao a dinheiro. NOT NULL porque todo item tem um valor
-- unitario praticado naquela venda.
--
-- bairro_entrega TEXT, sem NOT NULL: o bairro de destino so existe
-- nas vendas entregues em domicilio; nas vendas retiradas no balcao
-- ele nao existe (regra 2). A ausencia de valor e modelada pela
-- ausencia da restricao NOT NULL, e nao por um texto convencional
-- como 'Balcao', porque isso destruiria a distincao entre "esta
-- venda nao tem entrega" e "esta venda tem entrega para um bairro
-- desconhecido".

-- 2.3 Carga dos dados

INSERT INTO itens_venda
    (venda_id, data_venda, bairro_entrega, produto_id, produto_nome,
     categoria, unidade, quantidade, valor_unitario)
VALUES
-- 2026-08-03, segunda-feira
(3001, '2026-08-03', NULL, 1, 'Banana prata', 'Fruta', 'Kg', 1.235, 5.99),
(3001, '2026-08-03', NULL, 5, 'Tomate', 'Legume', 'Kg', 0.874, 7.49),
(3001, '2026-08-03', NULL, 10, 'Alface crespa', 'Verdura', 'UN', 1.000, 2.99),
(3001, '2026-08-03', NULL, 12, 'Cheiro-verde', 'Verdura', 'UN', 2.000, 2.50),
(3002, '2026-08-03', NULL, 6, 'Batata', 'Legume', 'Kg', 2.140, 4.99),
(3002, '2026-08-03', NULL, 9, 'Cebola', 'Legume', 'Kg', 0.965, 5.19),
(3003, '2026-08-03', 'Centro', 3, 'Abacaxi', 'Fruta', 'UN', 2.000, 7.90),
(3003, '2026-08-03', 'Centro', 2, 'Laranja pera', 'Fruta', 'Kg', 3.180, 3.79),
(3003, '2026-08-03', 'Centro', 8, 'Cenoura', 'Legume', 'Kg', 1.020, 4.29),
-- 2026-08-04, terca-feira
(3004, '2026-08-04', NULL, 5, 'Tomate', 'Legume', 'Kg', 1.460, 7.49),
(3004, '2026-08-04', NULL, 7, 'Batata-doce', 'Legume', 'Kg', 1.785, 4.49),
(3004, '2026-08-04', NULL, 11, 'Couve', 'Verdura', 'UN', 1.000, 3.00),
(3005, '2026-08-04', NULL, 4, 'Morango', 'Fruta', 'UN', 2.000, 9.90),
(3006, '2026-08-04', 'Lagoinha', 1, 'Banana prata', 'Fruta', 'Kg', 2.310, 5.99),
(3006, '2026-08-04', 'Lagoinha', 6, 'Batata', 'Legume', 'Kg', 1.505, 4.99),
(3006, '2026-08-04', 'Lagoinha', 10, 'Alface crespa', 'Verdura', 'UN', 2.000, 2.99),
(3006, '2026-08-04', 'Lagoinha', 12, 'Cheiro-verde', 'Verdura', 'UN', 1.000, 2.50),
-- 2026-08-05, quarta-feira
(3007, '2026-08-05', NULL, 2, 'Laranja pera', 'Fruta', 'Kg', 2.450, 3.49),
(3007, '2026-08-05', NULL, 5, 'Tomate', 'Legume', 'Kg', 0.635, 7.99),
(3008, '2026-08-05', NULL, 8, 'Cenoura', 'Legume', 'Kg', 0.780, 4.39),
(3008, '2026-08-05', NULL, 9, 'Cebola', 'Legume', 'Kg', 1.215, 5.19),
(3008, '2026-08-05', NULL, 11, 'Couve', 'Verdura', 'UN', 2.000, 3.00),
(3009, '2026-08-05', 'Centro', 3, 'Abacaxi', 'Fruta', 'UN', 1.000, 7.50),
(3009, '2026-08-05', 'Centro', 4, 'Morango', 'Fruta', 'UN', 1.000, 9.49),
(3009, '2026-08-05', 'Centro', 1, 'Banana prata', 'Fruta', 'Kg', 1.890, 6.29),
-- 2026-08-06, quinta-feira
(3010, '2026-08-06', NULL, 7, 'Batata-doce', 'Legume', 'Kg', 0.925, 4.79),
(3010, '2026-08-06', NULL, 10, 'Alface crespa', 'Verdura', 'UN', 1.000, 3.29),
(3011, '2026-08-06', NULL, 5, 'Tomate', 'Legume', 'Kg', 1.975, 8.49),
(3011, '2026-08-06', NULL, 6, 'Batata', 'Legume', 'Kg', 3.020, 5.29),
(3011, '2026-08-06', NULL, 12, 'Cheiro-verde', 'Verdura', 'UN', 3.000, 2.50),
(3012, '2026-08-06', 'Planalto', 2, 'Laranja pera', 'Fruta', 'Kg', 4.060, 3.49),
(3012, '2026-08-06', 'Planalto', 8, 'Cenoura', 'Legume', 'Kg', 1.340, 4.39),
-- 2026-08-07, sexta-feira
(3013, '2026-08-07', NULL, 1, 'Banana prata', 'Fruta', 'Kg', 0.965, 6.49),
(3013, '2026-08-07', NULL, 9, 'Cebola', 'Legume', 'Kg', 0.540, 5.49),
(3013, '2026-08-07', NULL, 11, 'Couve', 'Verdura', 'UN', 1.000, 3.50),
(3014, '2026-08-07', 'Lagoinha', 4, 'Morango', 'Fruta', 'UN', 3.000, 8.90),
(3014, '2026-08-07', 'Lagoinha', 3, 'Abacaxi', 'Fruta', 'UN', 1.000, 6.99),
-- 2026-08-08, sabado
(3015, '2026-08-08', NULL, 6, 'Batata', 'Legume', 'Kg', 1.250, 5.49),
(3016, '2026-08-08', NULL, 5, 'Tomate', 'Legume', 'Kg', 1.115, 8.99),
(3016, '2026-08-08', NULL, 7, 'Batata-doce', 'Legume', 'Kg', 1.360, 4.79);

-- 2.4 Insercao de uma venda
-- Venda 3017, realizada em 08/08/2026, retirada no balcao: 1,340 kg
-- de tomate a R$ 8,99 o quilograma, dois pes de alface crespa a
-- R$ 3,49 cada, e uma bandeja de morango a R$ 9,90. Sem entrega,
-- portanto o bairro fica sem valor.

INSERT INTO itens_venda
    (venda_id, data_venda, bairro_entrega, produto_id, produto_nome,
     categoria, unidade, quantidade, valor_unitario)
VALUES
(3017, '2026-08-08', NULL, 5, 'Tomate', 'Legume', 'Kg', 1.340, 8.99),
(3017, '2026-08-08', NULL, 10, 'Alface crespa', 'Verdura', 'UN', 2.000, 3.49),
(3017, '2026-08-08', NULL, 4, 'Morango', 'Fruta', 'UN', 1.000, 9.90);

-- 2.5 Conferencia
-- Deve devolver 43 linhas, com as tres ultimas correspondendo a
-- venda 3017.

SELECT * FROM itens_venda;

-- ============================================================
-- PARTE 3. CONSULTAS
-- ============================================================

-- Recuperacao e filtros

-- Consulta 1
-- Cadastro de produtos, reconstruido a partir dos itens.
SELECT DISTINCT
    produto_id,
    produto_nome,
    categoria,
    unidade
FROM
    itens_venda
ORDER BY
    categoria,
    produto_nome;

-- Consulta 2
SELECT
    venda_id,
    produto_nome,
    valor_unitario
FROM
    itens_venda
WHERE
    categoria IN ('Legume', 'Verdura')
    AND valor_unitario BETWEEN 3.00 AND 5.00
ORDER BY
    valor_unitario DESC,
    venda_id;

-- Consulta 3
SELECT
    venda_id,
    data_venda,
    produto_nome,
    quantidade
FROM
    itens_venda
WHERE
    produto_nome LIKE 'Batata%'
ORDER BY
    data_venda,
    venda_id;

-- Consulta 4
SELECT DISTINCT
    venda_id,
    data_venda,
    bairro_entrega
FROM
    itens_venda
WHERE
    bairro_entrega IS NOT NULL
ORDER BY
    venda_id;

-- Expressoes e agregacao

-- Consulta 5
-- Segunda pagina de cinco itens, do sexto ao decimo, pelo valor do
-- item, do maior para o menor.
SELECT
    venda_id,
    produto_nome,
    quantidade,
    unidade,
    valor_unitario,
    ROUND(quantidade * valor_unitario, 2) AS valor_item
FROM
    itens_venda
ORDER BY
    valor_item DESC,
    venda_id ASC
LIMIT 5 OFFSET 5;

-- Consulta 6
-- O destino e o bairro de entrega ou, nas vendas sem entrega, o
-- texto 'Retirada no balcao' (COALESCE, aula pratica 03, secao 7.11).
SELECT
    venda_id,
    data_venda,
    COALESCE(bairro_entrega, 'Retirada no balcao') AS destino,
    COUNT(*) AS itens,
    ROUND(SUM(quantidade * valor_unitario), 2) AS valor_total
FROM
    itens_venda
GROUP BY
    venda_id,
    data_venda,
    bairro_entrega
ORDER BY
    valor_total DESC;

-- Consulta 7
SELECT
    data_venda,
    COUNT(DISTINCT venda_id) AS vendas,
    COUNT(*) AS itens,
    ROUND(SUM(quantidade * valor_unitario), 2) AS faturamento
FROM
    itens_venda
GROUP BY
    data_venda
ORDER BY
    data_venda;

-- Consulta 8
SELECT
    produto_id,
    produto_nome,
    unidade,
    SUM(quantidade) AS qtd_total,
    ROUND(SUM(quantidade * valor_unitario), 2) AS faturamento,
    ROUND(AVG(valor_unitario), 2) AS media_simples,
    ROUND(SUM(quantidade * valor_unitario) / SUM(quantidade), 2) AS media_ponderada
FROM
    itens_venda
GROUP BY
    produto_id,
    produto_nome,
    unidade
ORDER BY
    faturamento DESC;

-- Consulta 9
-- Agrupada tambem por unidade: a quantidade total so tem sentido
-- somando valores da mesma unidade de medida (aula pratica 04,
-- secao 7.4), e a categoria Fruta reune produtos vendidos em Kg
-- (banana, laranja) e em UN (abacaxi, morango).
SELECT
    categoria,
    unidade,
    COUNT(*) AS itens,
    SUM(quantidade) AS qtd_total,
    ROUND(SUM(quantidade * valor_unitario), 2) AS faturamento
FROM
    itens_venda
GROUP BY
    categoria,
    unidade
ORDER BY
    categoria;

-- Consulta 10
SELECT
    bairro_entrega,
    COUNT(DISTINCT venda_id) AS entregas,
    ROUND(SUM(quantidade * valor_unitario), 2) AS faturamento
FROM
    itens_venda
WHERE
    bairro_entrega IS NOT NULL
GROUP BY
    bairro_entrega
HAVING
    ROUND(SUM(quantidade * valor_unitario), 2) > 40.00
ORDER BY
    faturamento DESC;

-- Consulta 11
SELECT
    venda_id,
    ROUND(SUM(quantidade * valor_unitario), 2) AS total_arredondado,
    SUM(ROUND(quantidade * valor_unitario, 2)) AS soma_dos_itens_arredondados
FROM
    itens_venda
GROUP BY
    venda_id
HAVING
    ROUND(SUM(quantidade * valor_unitario), 2)
    <> SUM(ROUND(quantidade * valor_unitario, 2))
ORDER BY
    venda_id;

-- ============================================================
-- PARTE 4. ANALISE DO MODELO E DA TABELA
-- ============================================================

-- Questao 1.
-- Repetem, em varias linhas, um fato que pertence apenas a venda:
-- venda_id, data_venda e bairro_entrega. Toda vez que uma venda tem
-- mais de um item, esses tres valores aparecem identicos em todas
-- as linhas daquela venda (ver a Consulta 6, em que cada grupo de
-- venda_id, data_venda, bairro_entrega corresponde a uma unica
-- venda).
--
-- Repetem um fato que pertence apenas ao produto: produto_nome,
-- categoria e unidade. Toda vez que um produto aparece em mais de
-- uma venda, esses tres valores se repetem identicos em cada linha
-- daquele produto_id (ver a Consulta 1, em que cada produto_id
-- distinto aparece com um unico nome, uma unica categoria e uma
-- unica unidade).
--
-- valor_unitario tambem se repete em varias linhas (por exemplo, o
-- cheiro-verde vale sempre 2.50), mas essa repeticao nao e da mesma
-- natureza. produto_nome, categoria e unidade sao atributos
-- permanentes do produto: nao mudam de uma venda para outra. Ja o
-- valor_unitario e o preco praticado naquela venda especifica, e o
-- preco dos produtos muda ao longo da semana, conforme a oferta
-- (regra 7 do minimundo). A coincidencia de valor entre linhas do
-- cheiro-verde e um fato observado nos dados de teste, nao uma
-- regra do minimundo; nada impede que outro periodo da carga traga
-- precos diferentes para o mesmo produto, como de fato acontece com
-- o tomate e a banana prata.
--
-- Se o nome de um produto fosse alterado em somente algumas das
-- linhas em que aparece, a Consulta 1 deixaria de reconstruir um
-- cadastro correto: o mesmo produto_id apareceria em duas linhas
-- distintas do resultado, uma com cada nome, porque o DISTINCT opera
-- sobre a combinacao das quatro colunas e nao sobre produto_id
-- isoladamente. Na Consulta 8, o efeito seria pior: o GROUP BY lista
-- produto_id, produto_nome e unidade, entao as linhas do produto se
-- dividiriam em dois grupos, um para cada nome, e o faturamento, a
-- quantidade total e as duas medias do produto ficariam divididos
-- entre esses dois grupos, quando deveriam ser um unico valor por
-- produto.

-- Questao 2.
-- Regra 6, nao garantida: "um produto aparece no maximo uma vez em
-- cada venda". Nada na tabela impede que o mesmo produto_id apareca
-- duas vezes na mesma venda_id.
--
-- Regra 7, nao garantida: "a quantidade vendida e sempre maior que
-- zero". A coluna quantidade e NUMERIC(10,3) NOT NULL, o que exige
-- um valor, mas nao impede que esse valor seja zero ou negativo.
--
-- INSERT que o SGBD aceitaria, sem executar, violando a regra 6
-- (repete o produto 5 na venda 3001, que ja tem esse produto):
--
-- INSERT INTO itens_venda
--     (venda_id, data_venda, bairro_entrega, produto_id,
--      produto_nome, categoria, unidade, quantidade, valor_unitario)
-- VALUES
--     (3001, '2026-08-03', NULL, 5, 'Tomate', 'Legume', 'Kg', 0.500, 7.49);

-- Questao 3.
-- A media ponderada do morango (9.41) e menor que a media simples
-- (9.55) porque a maior quantidade vendida (3 unidades, na venda
-- 3014) ocorreu justamente pelo menor preco (8.90). A media
-- ponderada da mais peso as vendas com mais unidades, e uma venda
-- grande a um preco baixo puxa o resultado para baixo, abaixo da
-- media simples dos quatro precos praticados.
--
-- A media ponderada do abacaxi (7.57) e maior que a media simples
-- (7.46) pelo motivo inverso: a maior quantidade vendida (2
-- unidades, na venda 3003) ocorreu pelo maior preco (7.90), o que
-- puxa a media ponderada para cima.
--
-- As duas medias do cheiro-verde sao iguais (2.50) porque o valor
-- unitario desse produto nunca mudou nas tres vendas em que aparece:
-- as tres linhas trazem exatamente 2.50. Quando todos os valores
-- que entram na media sao iguais, ponderar por quantidade nao altera
-- nada, porque nao ha variacao de preco para a ponderacao redistribuir.
