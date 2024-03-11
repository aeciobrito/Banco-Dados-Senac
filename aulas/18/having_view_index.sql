# HAVING

-- Selecionar chalés com média de capacidade superior a 3
SELECT codChale, AVG(capacidade) AS capacidade_media
FROM chale
GROUP BY codChale
HAVING capacidade_media > 3;

-- Selecione os clientes com mais de uma hospedagem registrada
SELECT codCliente, COUNT(*) AS qtd_hospedagens
FROM hospedagem
GROUP BY codCliente
HAVING COUNT(*) > 1;

-- Selecionar Serviços com valor total superior a 40
SELECT hospedagem_servico.codHospedagem, SUM(servico.valorServico) AS total_valor
FROM hospedagem_servico
JOIN servico ON hospedagem_servico.codServico = servico.codServico
GROUP BY hospedagem_servico.codHospedagem
HAVING total_valor > 40;


