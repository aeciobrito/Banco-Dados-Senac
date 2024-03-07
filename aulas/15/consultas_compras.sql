-- SELECT TUDO DA TABELA X
SELECT * FROM PEDIDO;

-- SELECT COM CONTAGEM TOTAL DE REGISTROS
SELECT COUNT(*) AS Total_Pedidos 
FROM pedido;

-- SELECT QUANTOS PEDIDOS CADA CLIENTE FEZ
SELECT ClienteID, COUNT(*)
FROM pedido
GROUP BY ClienteID;

-- SELECIONAR O TOTAL DE PRODUTOS POR PEDIDO
SELECT pedidoId, COUNT(*) AS ProdutosPorPedido
FROM itenspedido
GROUP BY pedidoId;

-- SELECIONAR PRODUTOS MAIS VENDIDOS
SELECT produtoId, SUM(quantidade) AS MaisVendidos
FROM itenspedido
GROUP BY produtoId
ORDER BY MaisVendidos DESC;

-- LISTE OS CLIENTES INFORMANDO: 
-- TOTAL GASTO, MEDIA DE PRODUTOS, DATA DO PRIMEIRO E ÚLTIMO PEDIDO

SELECT  
	cliente.nome AS Cliente, 
    COUNT(*) AS NumPedidos,
    SUM(produto.preco * itenspedido.quantidade) AS TotalGasto,
    AVG(itenspedido.quantidade) AS MediaProdutosPorPedido,
    MIN(pedido.dataPedido) AS PrimeiroPedido,
    MAX(pedido.dataPedido) AS UltimoPedido
FROM pedido
JOIN itenspedido ON pedido.id = itenspedido.pedidoId
JOIN produto ON itenspedido.produtoId = produto.id
JOIN cliente ON pedido.clienteId = cliente.id
GROUP BY pedido.clienteId;

-- Encontrar produtos com o preço entre 50 e 150 reais
SELECT * 
FROM produto
WHERE preco >= 50 AND preco <= 150;

SELECT * FROM produto
WHERE preco BETWEEN 50 AND 150;

-- Mostre tudo dos produtos com ID 1, 5 e 7
SELECT * FROM produto
WHERE id = 1 OR id = 5 OR id = 7;

SELECT * FROM produto
WHERE id IN (1, 3, 7);

-- Mostre todos os clientes que o sobremnome termine com "a"
SELECT * FROM cliente
WHERE sobrenome LIKE '%a';

-- Mostre os 5 produtos mais caros da loja
SELECT * FROM produto
ORDER BY preco DESC
LIMIT 5;

-- Listando os produtos por página, cada página cabendo 2 produtos, me mostre a página 3
SELECT * FROM produto
LIMIT 2 OFFSET 4;

-- Consultar os pedidos feitos entre 2024-03-01 e 2024-03-05, limitando a 5 resultados
SELECT * FROM pedido
WHERE dataPedido BETWEEN '2024-03-01' AND '2024-03-05'
ORDER BY dataPedido
LIMIT 5;