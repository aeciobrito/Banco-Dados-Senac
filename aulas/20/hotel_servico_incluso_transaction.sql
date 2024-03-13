-- Criar uma transaction que, quando o cliente fizer uma hospedagem
START TRANSACTION;
SET @cafeManhaID = 1;
SET @dataEntrada = '2024-01-01';

INSERT INTO hospedagem (codChale, codCliente, dataInicio, dataFim, qtdPessoas, desconto, valorFinal) VALUES
	(3, 5, @dataEntrada, '2024-03-01', 3, 0, 370.00);
SET @hospedagemID = last_insert_id();

-- Automaticamente adicione um café da manhã para a sua hospedagem
INSERT INTO hospedagem_servico 
	values(@hospedagemID, @cafeManhaID, @dataEntrada);

COMMIT;