CREATE DATABASE hotel;

USE hotel;

CREATE TABLE Cliente (
  codCliente INT PRIMARY KEY AUTO_INCREMENT,
  nomeCliente VARCHAR(255) NOT NULL,
  rgCliente VARCHAR(20) NOT NULL,
  enderecoCliente VARCHAR(255) NOT NULL,
  bairroCliente VARCHAR(255) NOT NULL,
  cidadeCliente VARCHAR(255) NOT NULL,
  estadoCliente CHAR(2) NOT NULL,
  CEPCliente CHAR(8) NOT NULL,
  nascimentoCliente DATE NOT NULL
);

CREATE TABLE Telefone (
  telefone INT PRIMARY KEY,
  codCliente INT,
  tipoTelefone VARCHAR(255) NOT NULL,
  FOREIGN KEY (codCliente) REFERENCES Cliente(codCliente)
);

CREATE TABLE Chale (
  codChale INT PRIMARY KEY AUTO_INCREMENT,
  localizacao VARCHAR(255) NOT NULL,
  capacidade INT NOT NULL,
  valorAltaEstacao DECIMAL(10,2) NOT NULL,
  valorBaixaEstacao DECIMAL(10,2) NOT NULL
);

CREATE TABLE Hospedagem (
  codHospedagem INT PRIMARY KEY AUTO_INCREMENT,
  codChale INT,
  codCliente INT,
  dataInicio DATE NOT NULL,
  dataFim DATE NOT NULL,
  qtdPessoas INT NOT NULL,
  desconto DECIMAL(10,2) DEFAULT 0.0,
  valorFinal DECIMAL(10,2),
  FOREIGN KEY (codChale) REFERENCES Chale(codChale),
  FOREIGN KEY (codCliente) REFERENCES Cliente(codCliente)
);

CREATE TABLE Item (
  nomeItem VARCHAR(255) PRIMARY KEY,
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
  FOREIGN KEY (codChale) REFERENCES Chale(codChale),
  FOREIGN KEY (nomeItem) REFERENCES Item(nomeItem)
);
