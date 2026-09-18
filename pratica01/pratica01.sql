-- Active: 1789690209143@@127.0.0.1@5432@bd_aula@public

-- APS I - BANCO DE DADOS
-- ALUNO: IGOR VINÍCIUS ROMAO DE MAGALHAES
-- TURMA: SISTEMAS DE INFORMACAO - 4A


-- CRIACAO DA TABELA:
DROP TABLE IF EXISTS itens_venda;
CREATE TABLE itens_venda(
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    venda_id INTEGER NOT NULL,
    data_venda DATE NOT NULL,
    bairro_entrega TEXT NULL,      
    produto_id     INTEGER NOT NULL,
    produto_nome   TEXT NOT NULL,
    categoria      TEXT NOT NULL,
    unidade        TEXT NOT NULL,
    quantidade     NUMERIC(10,3) NOT NULL,  
    valor_unitario NUMERIC(10,2) NOT NULL   
);

--- Justificativas de tipos e restricoes

--- bairro_entrega: nem todos os clientes necessitam de entrega, por isso NULL, 
--- text pois os bairros sao escritos na tabela

--- quantidade: NOTNULL é necessário porque o produto selecionado
--- precisa obrigatoriamente ter uma quantidade, NUMERIC porque é representado por números
--- precisao de gramas (10,3) atendendo a regra 5

--- valor_unitario: NOTNULL é necessário porque o produto selecionado
--- precisa obrigatoriamente ter uma valor, NUMERIC porque é representado por números
--- precisao de valor (10,2) atendendo a regra 7


--- CARGA DOS DADOS:

INSERT INTO itens_venda (venda_id, data_venda, bairro_entrega, produto_id, produto_nome,
 categoria, unidade, quantidade, valor_unitario) VALUES
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
(3016, '2026-08-08', NULL, 7, 'Batata-doce', 'Legume', 'Kg', 1.360, 4.79)

INSERT INTO itens_venda (venda_id, data_venda, bairro_entrega, produto_id, produto_nome,
categoria, unidade, quantidade, valor_unitario) VALUES
(3017, '2026-08-08', NULL, 5, 'Tomate', 'Legume', 'Kg', 1.340, 8.99),
(3017, '2026-08-08', NULL, 10, 'Alface crespa', 'Verdura', 'UN', 2.000, 3.49),
(3017, '2026-08-08', NULL, 4, 'Morango', 'Fruta', 'UN', 1.000, 9.99)

SELECT
    venda_id AS "ID da Venda",
    data_venda AS "Data da Venda", 
    bairro_entrega AS "Entrega/Bairro", 
    produto_id AS "ID do Produto", 
    produto_nome AS "Nome do Produto",
    categoria AS "Categoria", 
    unidade AS "Unidade", 
    quantidade AS "Quantidade", 
    valor_unitario AS "Valor Unitário"
FROM
    itens_venda;


------------------------- CONSULTA 01 ------------------------- 

SELECT DISTINCT --- DISTINCT: tirar linhas duplicadas e retornar valores unicos
    produto_id,
    produto_nome,
    categoria,
    unidade
FROM
    itens_venda
ORDER BY
    categoria,
    produto_nome;

------------------------- CONSULTA 02 ------------------------- 

SELECT
    venda_id,
    produto_nome,
    valor_unitario
FROM
    itens_venda
WHERE
    categoria IN ('Legume', 'Verdura') --- IN: utilizado p/ pegar valores das 2 categorias
    AND valor_unitario BETWEEN 3.00 AND 5.00 --- AND: segunda condicao, BETWEEN: recorte de valor
ORDER BY
    valor_unitario DESC, --- DESC: menor p/ maior
    venda_id; --- Desempate: número da venda


------------------------- CONSULTA 03 -------------------------

SELECT
    venda_id,
    data_venda,
    produto_nome,
    quantidade
FROM
    itens_venda
WHERE
    produto_nome LIKE 'Batata%' --- LIKE: usado p/ buscar texto e %: qlqr tipo de batata
ORDER BY
    data_venda, --- ordem de venda
    venda_id; --- desempate, ID


------------------------- CONSULTA 04 -------------------------

SELECT DISTINCT
    venda_id,
    data_venda,
    bairro_entrega
FROM
    itens_venda
WHERE
    bairro_entrega IS NOT NULL --- mostrar so oq foi entregue
ORDER BY
    venda_id;


------------------------- CONSULTA 05 -------------------------
SELECT
    venda_id,
    produto_nome,
    quantidade,
    unidade,
    valor_unitario,
    ROUND(quantidade * valor_unitario, 2) AS valor_item --- Round: arredondar 
FROM
    itens_venda
ORDER BY
    valor_item DESC,
    venda_id ASC
LIMIT 5 OFFSET 5; --- Limite: so uso 5 exemplos, OFFSET: pulo os 5 primeiros 


------------------------- CONSULTA 06 -------------------------
SELECT
    venda_id,
    data_venda,
    COALESCE(bairro_entrega, 'Retirada no balcao') AS destino, --- COALESCE: reescrita, troco o null e coloco retirada no balcao
    COUNT(*) AS itens, --- COUNT: conta quantos itens tem na venda
    ROUND(SUM(quantidade * valor_unitario), 2) AS valor_total --- SUM: soma os valores, dps multiplica qnt e valor
FROM
    itens_venda
GROUP BY                   --- GROUP BY: agrupar por vendas
    venda_id,
    data_venda,
    bairro_entrega
ORDER BY
    valor_total DESC;      --- DESC: ordem decrescente


------------------------- CONSULTA 07 -------------------------
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

------------------------- CONSULTA 08 -------------------------
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


------------------------- CONSULTA 09 -------------------------
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


------------------------- CONSULTA 10 -------------------------
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

------------------------- CONSULTA 11 -------------------------
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

--- Parte 4: Análise do Modelo e da Tabela

--- 01: Se repetem atoa: Informações da venda (como número, data e bairro) 
--- e dados fixos do produto (nome, categoria e unidade) aparecem repetidos 
--- em várias linhas quando há mais de um item.



--- 02: -- Questao 2.
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



--- 03: Morango: A média ponderada ficou menor que a simples 
--- porque a maior quantidade vendida ocorreu justamente no 
--- dia em que o preço estava mais barato, puxando a média para baixo.

--- Abacaxi: Aconteceu o inverso. A média ponderada ficou maior porque 
--- a maior venda foi feita no dia em que o preço estava mais alto.

--- Cheiro-verde: As duas médias deram exatamente iguais 
--- porque o preço desse produto nunca mudou nas vendas registradas. 
--- Sem variação de preço, o peso da quantidade não altera o resultado.


