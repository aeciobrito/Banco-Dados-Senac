START TRANSACTION;
SET @aulunoID = 7;
-- Matricular um aluno
INSERT INTO gestaoacademica.matricula values
	(@aulunoID, 1, current_date());

-- Altero o gestaoacademica.aluno.matriculado para TRUE
UPDATE gestaoacademica.aluno
SET matriculado = true
WHERE matricula = @aulunoID;

-- Confirma
COMMIT;