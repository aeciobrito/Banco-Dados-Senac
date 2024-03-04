-- Selecionar professores e disciplinas associadas 
SELECT Professor.Nome AS Professor, Disciplina.Nome AS Disciplina 
FROM Professor 
JOIN professores_disciplinas ON Professor.ID = professores_disciplinas.Professor_ID 
JOIN disciplina ON professores_disciplinas.Disciplina_ID = disciplina.Id;

-- Selecionar todos os alunos
 
-- Selecionar apenas os nomes e CPFs dos alunos
 
-- Selecionar alunos matriculados após uma data específica
 
-- Contar quantas disciplinas existem com carga horária maior que X

-- Contar quantas matrículas existem para cada curso
 
-- Contar quantas disciplinas cada professor leciona
 
-- Combinar nome do aluno e data da matrícula
 
-- Combinar nome do curso e nome do aluno
 
-- Contar quantos alunos se matricularam em cada curso