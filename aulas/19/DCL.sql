-- Listar Usuários do Sistema
SELECT User, Host FROM mysql.user;

-- Criação de um Usuário de Aplicação
CREATE USER 'aplicacao'@'localhost'
IDENTIFIED BY 'Aplicacao@123';

-- Crie um usuario "Administrador" com permissao de acesso
-- de qualquer lugar, com nossa senha padrao
CREATE USER 'Adminstrador'@'%'
IDENTIFIED BY 'Administrador@123';

-- Mudar senha de usuário
SET PASSWORD FOR 'aplicacao'@'localhost' = PASSWORD('Aplicacao@321');

-- Mudar o host do usuario
RENAME USER 'aplicacao'@'localhost' TO 'aplicacao'@'%';

-- Remover um usuário
DROP USER 'aplicacao'@'%';

-- Conceder permissões necessárias para o usuário acessar o BD desejado
-- GRANT tipo_de_permissao ON nome_do_banco.nome_da_tabela TO 'usuario'@'lugar';
GRANT ALL PRIVILEGES ON gestaoacademica.* TO 'aplicacao'@'localhost';

GRANT SELECT ON compras.pedido TO 'aplicacao'@'localhost';

-- Verificar permissões por usuário
SHOW GRANTS FOR 'aplicacao'@'localhost';

-- Revogar permissões
-- REVOKE tipo_permissao ON banco.tablea FROM 'usuario'@'local';
REVOKE select ON compras.pedido FROM 'aplicacao'@'localhost';
