Execute o script na raiz desse repositório chamado "gestao_academica.sql" (caso já tenha o banco, drop o schema e crie um novo com base nesse script).

Crie um novo script e cole nele os seguintes comentários:

-- Selecionar todos os alunos

-- Selecionar apenas os nomes e CPFs dos alunos

-- Selecionar alunos matriculados após uma data específica

-- Contar quantas disciplinas existem com carga horária maior que X

-- Contar quantas matrículas existem para cada curso

-- Contar quantas disciplinas cada professor leciona

-- Combinar nome do aluno e data da matrícula

-- Combinar nome do curso e nome do aluno

-- Contar quantos alunos se matricularam em cada curso

Resolva as consultas que conseguir. Para as que não conseguir, adicione comentários informando suas dúvidas e até onde conseguiu evoluir seu código.

Envie um commit com a solução para o sue respositório e me encaminhe o link no Teams.

Exemplo Join N*N

-- Selecionar professores e disciplinas associadas
SELECT Professor.Nome AS Professor, Disciplina.Nome AS Disciplina
FROM Professor
JOIN professores_disciplinas 
ON Professor.ID = professores_disciplinas.Professor_ID
JOIN disciplina 
ON professores_disciplinas.Disciplina_ID = disciplina.Id;