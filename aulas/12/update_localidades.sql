USE localidades;

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
    
    