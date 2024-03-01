-- CRIAÇÃO E USO DO SCHEMA (BD)
CREATE SCHEMA IF NOT EXISTS LOCALIDADES;
USE LOCALIDADES;

-- CRIAÇÃO DAS TABELAS
CREATE TABLE IF NOT EXISTS ESTADO (
	Id INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(50) NOT NULL,
    Sigla VARCHAR(2) NOT NULL
);

CREATE TABLE IF NOT EXISTS CIDADE (
	Id INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(50) NOT NULL,
    Estado_Id INT,
    FOREIGN KEY (Estado_ID) REFERENCES ESTADO(Id)
);

SELECT * FROM CIDADE;
SELECT * FROM ESTADO;

-- INSERÇÃO DE DADOS REAIS
INSERT INTO ESTADO (Nome, Sigla) VALUES
	('São Paulo', 'SP'),
    ('Rio de Janeiro', 'RJ'),
    ('Bahia', 'BA');

INSERT INTO CIDADE (Nome, Estado_ID) VALUES 
	('São Paulo', 1),
    ('Campinas', 1),
    ('Rio de Janeiro', 2),
    ('Niterói', 2),
    ('Salvador', 3),
    ('Fira de Santana', 3);
    
-- Inserção de Cidades Fictícias sem Estado
INSERT INTO CIDADE (Nome, Estado_ID) VALUES
	('Gotham City', NULL),
    ('Metropolis', NULL),
    ('Wonderland', NULL),
    ('Neverland', NULL);


CREATE TABLE PREFEITO(
	ID INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(50) NOT NULL,
    DataPosse DATE NOT NULL
);

ALTER TABLE CIDADE
ADD COLUMN Prefeito_ID INT,
ADD FOREIGN KEY (Prefeito_ID) REFERENCES PREFEITO(Id);

select * from cidade;

INSERT INTO PREFEITO (Nome, DataPosse) VALUES
	('João da Silva', '2024-01-01'),
    ('Maria Oliveira', '2023-01-01'),
    ('Carlos Santos', '2021-01-01');
    
UPDATE CIDADE
SET Prefeito_ID = 1
WHERE Nome = 'São Paulo';

UPDATE CIDADE
SET Prefeito_ID = 2
WHERE ID = 5;

UPDATE CIDADE
SET Prefeito_ID = 3
WHERE Estado_ID = 2 AND ID = 3;
