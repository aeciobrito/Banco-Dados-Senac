## Utilize o banco de dados hotel (disponível no github) para responder a atividade
# Consultas sem JOINS
-- Consulte todos os clientes de São Paulo (SP)
SELECT * FROM Cliente WHERE estadoCliente = 'SP';

-- Selecionar hospedagens com mais de 3 pessoas e desconto igual a 0
SELECT * FROM HOSPEDAGEM WHERE qtdPessoas > 3 AND desconto = 0.0;

-- Selecionar telefones de clientes com ID 1 ou 2, limitando a 2 resultados
SELECT * FROM TELEFONE
WHERE codCliente = 1 OR codCliente = 2 LIMIT 2;

-- Selecionar chalés com capacidades entre 4 e 6, ordenaos por valor em alta estação
SELECT * FROM Chale WHERE capacidade BETWEEN 4 AND 6 ORDER BY valorAltaEstacao DESC;

-- Selecione todos os itens que contenham "de" na descrição, pulando os 2 primeiros resultados
SELECT * FROM Item WHERE descricaoItem LIKE ('%de%') LIMIT 100 OFFSET 2;

# Consultas com JOINS
-- Selecioar detalhes da hospedagem, incluindo informações do cliente
-- Selecionar chalés com os itens associados
-- Selecionar serviços utilizados em uma hospedagem
-- Consultar os clientes com seus telefones
-- Selecionar chalés ocupados em uma data específica

