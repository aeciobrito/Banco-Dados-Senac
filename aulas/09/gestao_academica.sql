-- -------------------------------
-- DDL - Criação de Banco de Dados
-- -------------------------------
CREATE SCHEMA IF NOT EXISTS gestaoacademica;
USE gestaoacademica;

-- ------------------------
-- DDL - Criação de Tabelas
-- ------------------------
CREATE TABLE IF NOT EXISTS gestaoacademica.aluno(
	Matricula INT AUTO_INCREMENT,
    Nome VARCHAR(50) NOT NULL,
    Cpf VARCHAR(11) NOT NULL UNIQUE,
    PRIMARY KEY(Matricula)
);

CREATE TABLE IF NOT EXISTS gestaoacademica.curso(
	Id INT AUTO_INCREMENT,
    Nome VARCHAR(50) NULL DEFAULT NULL,    
    PRIMARY KEY(Id)
);

CREATE TABLE IF NOT EXISTS disciplina(
	Id INT AUTO_INCREMENT,
    Nome VARCHAR(50) NULL DEFAULT NULL,
    Horas INT NOT NULL DEFAULT 0,
    PRIMARY KEY(Id)
);

CREATE TABLE IF NOT EXISTS gestaoacademica.professor(
	Id INT AUTO_INCREMENT,
    Nome VARCHAR(100) NULL DEFAULT NULL,
    Especializacao VARCHAR(50) NULL DEFAULT NULL,
    PRIMARY KEY (Id)
);

CREATE TABLE IF NOT EXISTS matricula(
	Aluno_ID INT,
    Curso_ID INT,
    DataMatricula DATE NOT NULL,
    PRIMARY KEY (Aluno_ID, Curso_ID),
    FOREIGN KEY (Aluno_ID) REFERENCES Aluno(Matricula),
    FOREIGN KEY (Curso_ID) REFERENCES Curso(Id)
);

CREATE TABLE IF NOT EXISTS disciplinas_cursos(
	Disciplina_ID INT,
    Curso_ID INT,
    PRIMARY KEY (Disciplina_ID, Curso_ID),
    FOREIGN KEY (Disciplina_ID) REFERENCES Disciplina(Id),
	FOREIGN KEY (Curso_ID) REFERENCES Curso(Id)
);

CREATE TABLE IF NOT EXISTS professores_disciplinas(
	Professor_ID INT,
    Disciplina_ID INT,
    PRIMARY KEY (Professor_ID, Disciplina_ID),
    FOREIGN KEY (Professor_ID) REFERENCES Professor(Id),
    FOREIGN KEY (Disciplina_ID) REFERENCES Disciplina(Id)
);