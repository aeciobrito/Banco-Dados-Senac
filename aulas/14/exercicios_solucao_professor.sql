-- Selecionar professores e disciplinas associadas 
SELECT Professor.Nome AS Professor, Disciplina.Nome AS Disciplina 
FROM Professor 
JOIN professores_disciplinas ON Professor.ID = professores_disciplinas.Professor_ID 
JOIN disciplina ON professores_disciplinas.Disciplina_ID = disciplina.Id;

-- Selecionar todos os alunos
 SELECT * FROM aluno;
 
-- Selecionar apenas os nomes e CPFs dos alunos
 SELECT nome, cpf FROM aluno;
 
-- Selecionar alunos matriculados após uma data específica
 SELECT * FROM matricula
 JOIN aluno ON matricula.aluno_ID = aluno.matricula
 WHERE Matricula.DataMatricula > '2024-02-01';
 
-- Contar quantas disciplinas existem com carga horária maior que X
SELECT COUNT(*) AS QuantidadeDisciplinas
FROM disciplina
WHERE horas > 42;

-- Contar quantas matrículas existem para cada curso
 SELECT Curso.Nome, COUNT(*) AS QuantidadeMatriculas
 FROM Matricula
 JOIN Curso ON Matricula.Curso_ID = Curso.ID
 GROUP BY Curso.Nome;
 
-- Contar quantas disciplinas cada professor leciona
SELECT Professor.Nome, COUNT(*) AS QuantidadeDisciplinas
FROM professores_disciplinas
JOIN Professor ON professores_disciplinas.professor_id = professor.id
GROUP BY Professor.Nome;
 
-- Combinar nome do aluno e data da matrícula
 SELECT Aluno.Nome AS Aluno, Matricula.DataMatricula
 FROM matricula
 JOIN Aluno ON Matricula.Aluno_ID = Aluno.Matricula;
 
-- Combinar nome do curso e nome do aluno
 SELECT Curso.Nome AS Curso, Aluno.Nome AS Aluno
 FROM matricula
 JOIN curso on Matricula.curso_id = curso.id
 JOIN aluno on Matricula.aluno_id = aluno.matricula;
 
-- Contar quantos alunos se matricularam em cada curso
SELECT Curso.Nome, COUNT(DISTINCT Matricula.Aluno_ID) AS QuantidadeAlunos
FROM Matricula
JOIN Curso ON matricula.curso_id = curso.id
GROUP BY Curso.Nome;