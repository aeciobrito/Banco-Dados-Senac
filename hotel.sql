CREATE DATABASE hotel;
USE hotel;

CREATE TABLE Cliente (
	codCliente INT PRIMARY KEY AUTO_INCREMENT,
    nomeCliente VARCHAR(100) NOT NULL,
    rgCliente VARCHAR(15) NOT NULL,
    enderecoCliente VARCHAR(100) NOT NULL,
    bairroCliente VARCHAR(50) NOT NULL,
    cidadeCliente VARCHAR(50) NOT NULL,
    estadoCliente CHAR(2) NOT NULL,
    CEPCliente CHAR(8) NOT NULL,
    nascimentoCliente DATE NOT NULL
);

CREATE TABLE Telefone (
	telefone INT PRIMARY KEY,
    codCliente INT,
    tipoTelefone VARCHAR(50) NOT NULL,
    FOREIGN KEY (codCliente) REFERENCES Cliente(codCliente)
);

CREATE TABLE Chale (
	codChale INT PRIMARY KEY AUTO_INCREMENT,
	localizacao VARCHAR(100) NOT NULL,
    capacidade INT DEFAULT 1,
    valorAltaEstacao DECIMAL(10,2) NOT NULL,
    valorBaixaEstacao DECIMAL(10,2) NOT NULL
);

CREATE TABLE Hospedagem (
	codHospedagem INT PRIMARY KEY AUTO_INCREMENT,
    codChale INT,
    codCliente INT,
    dataInicio DATE NOT NULL,
    dataFim DATE,
    qtdPessoas INT DEFAULT 1,
    desconto DECIMAL(10,0) DEFAULT 0.0,
    valorFinal DECIMAL(10,2),
    FOREIGN KEY (codChale) REFERENCES Chale(codChale),
    FOREIGN KEY (codCliente) REFERENCES Cliente(codCliente)
);

CREATE TABLE Item (
	nomeItem VARCHAR (255) PRIMARY KEY,
    descricaoItem VARCHAR(255) NOT NULL
);

CREATE TABLE Servico (
	codServico INT PRIMARY KEY AUTO_INCREMENT,
    nomeServico VARCHAR(255) NOT NULL,
    valorServico DECIMAL(10,2) NOT NULL
);

CREATE TABLE Hospedagem_Servico (
	codHospedagem INT,
    codServico INT,
    dataServico DATE NOT NULL,
    PRIMARY KEY (codHospedagem, codServico),
    FOREIGN KEY (codHospedagem) REFERENCES Hospedagem(codHospedagem),
    FOREIGN KEY (codServico) REFERENCES Servico(codServico)
);

CREATE TABLE Chale_Item (
	codChale INT,
    nomeItem VARCHAR(255),
    PRIMARY KEY (codChale, nomeItem),
    FOREIGN KEY (codChale) REFERENCES Chale (codChale),
    FOREIGN KEY (nomeItem) REFERENCES Item (nomeItem)
);

-- Inserting data into Cliente table
INSERT INTO Cliente (nomeCliente, rgCliente, enderecoCliente, bairroCliente, cidadeCliente, estadoCliente, CEPCliente, nascimentoCliente)
VALUES
    ('João Silva', '123456789', 'Rua A, 123', 'Centro', 'Cidade A', 'SP', '12345678', '1990-01-15'),
    ('Maria Oliveira', '987654321', 'Av. B, 456', 'Bairro B', 'Cidade B', 'RJ', '87654321', '1985-05-20'),
    ('Carlos Santos', '345678901', 'Rua C, 789', 'Subúrbio', 'Cidade C', 'MG', '23456789', '1982-08-10'),
    ('Ana Pereira', '567890123', 'Av. D, 234', 'Centro', 'Cidade D', 'BA', '34567890', '1987-03-25'),
    ('Lucas Costa', '789012345', 'Rua E, 567', 'Bairro E', 'Cidade E', 'RS', '45678901', '1995-12-05'),
    ('Fernanda Lima', '901234567', 'Av. F, 678', 'Centro', 'Cidade F', 'SC', '56789012', '1980-06-18'),
    ('Gabriel Santos', '123012345', 'Rua G, 901', 'Subúrbio', 'Cidade G', 'PR', '67890123', '1992-09-30');

-- Inserting data into Telefone table
INSERT INTO Telefone (telefone, codCliente, tipoTelefone)
VALUES
    (123456789, 1, 'Celular'),
    (987654321, 2, 'Residencial'),
    (234567890, 3, 'Celular'),
    (345678901, 4, 'Comercial'),
    (456789012, 5, 'Residencial'),
    (567890123, 6, 'Celular'),
    (678901234, 7, 'Comercial');

-- Inserting data into Chale table
INSERT INTO Chale (localizacao, capacidade, valorAltaEstacao, valorBaixaEstacao)
VALUES
    ('Praia', 4, 300.00, 200.00),
    ('Montanha', 2, 250.00, 150.00),
    ('Campo', 3, 280.00, 180.00),
    ('Cidade', 5, 320.00, 220.00),
    ('Floresta', 4, 290.00, 190.00),
    ('Ilha', 2, 260.00, 160.00),
    ('Deserto', 3, 310.00, 210.00);

-- Inserting data into Hospedagem table
INSERT INTO Hospedagem (codChale, codCliente, dataInicio, dataFim, qtdPessoas, desconto, valorFinal)
VALUES
    (1, 1, '2024-03-07', '2024-03-14', 2, 10.00, 540.00),
    (2, 2, '2024-04-01', '2024-04-10', 3, 0.00, 350.00),
    (3, 3, '2024-05-15', '2024-05-20', 1, 5.00, 270.00),
    (4, 4, '2024-06-02', '2024-06-10', 4, 15.00, 600.00),
    (5, 5, '2024-07-12', '2024-07-18', 3, 8.00, 480.00),
    (6, 6, '2024-08-20', '2024-08-25', 2, 12.00, 320.00),
    (7, 7, '2024-09-10', '2024-09-18', 5, 20.00, 750.00);

-- Inserting data into Item table
INSERT INTO Item (nomeItem, descricaoItem)
VALUES
    ('Toalha', 'Toalha de banho'),
    ('TV', 'Televisão'),
    ('Cafeteira', 'Cafeteira elétrica'),
    ('Secador', 'Secador de cabelo'),
    ('CamaCasal', 'Cama de casal'),
    ('Frigobar', 'Frigobar'),
    ('ArCondicionado', 'Ar condicionado'),
    ('Wi-Fi', 'Conexão de Internet sem fio'),
    ('Estacionamento', 'Vaga de Estacionamento'),
    ('Passeio Guiado', 'Passeio turístico com guia'),
    ('Massagem', 'Serviço de Massagem'),
    ('Almoço', 'Refeição ao meio-dia'),
    ('Jantar', 'Refeição noturna');


-- Inserting data into Servico table
INSERT INTO Servico (nomeServico, valorServico)
VALUES
    ('Café da Manhã', 20.00),
    ('Limpeza Diária', 15.00),
    ('Wi-Fi', 10.00),
    ('Estacionamento', 25.00),
    ('Passeio Guiado', 50.00),
    ('Massagem', 40.00),
    ('Almoço', 30.00),
    ('Jantar', 35.00);

-- Inserting data into Hospedagem_Servico table
INSERT INTO Hospedagem_Servico (codHospedagem, codServico, dataServico)
VALUES
    (1, 1, '2024-03-08'),
    (2, 2, '2024-04-05'),
    (3, 3, '2024-05-16'),
    (4, 4, '2024-06-05'),
    (5, 5, '2024-07-13'),
    (6, 6, '2024-08-21'),
    (7, 7, '2024-09-11'),
    (1, 8, '2024-03-09');

-- Inserting data into Chale_Item table
INSERT INTO Chale_Item (codChale, nomeItem)
VALUES
    (1, 'Toalha'),
    (2, 'TV'),
    (3, 'Cafeteira'),
    (4, 'Secador'),
    (5, 'CamaCasal'),
    (6, 'Frigobar'),
    (7, 'ArCondicionado'),
    (1, 'Wi-Fi'),
    (2, 'Estacionamento'),
    (3, 'Passeio Guiado'),
    (4, 'Massagem'),
    (5, 'Almoço'),
    (6, 'Jantar'),
    (7, 'CamaCasal');
