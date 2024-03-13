-- Criação do banco de dados
CREATE DATABASE IF NOT EXISTS sistema_vendas;
USE sistema_vendas;

-- Tabela Categoria
CREATE TABLE IF NOT EXISTS Categoria (
    CategoriaID INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Descricao TEXT,
    DataCriacao DATETIME DEFAULT CURRENT_TIMESTAMP,
    DataAtualizacao DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    UsuarioAtualizacao INT,
    Ativo TINYINT(1) DEFAULT 1
);

-- Tabela FormaPagamento
CREATE TABLE IF NOT EXISTS FormaPagamento (
    FormaPagamentoID INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Descricao TEXT,
    DataCriacao DATETIME DEFAULT CURRENT_TIMESTAMP,
    DataAtualizacao DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    UsuarioAtualizacao INT,
    Ativo TINYINT(1) DEFAULT 1
);

-- Tabela Produto
CREATE TABLE IF NOT EXISTS Produto (
    ProdutoID INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Descricao VARCHAR(250),
    Preco DECIMAL(10,2) NOT NULL,
    CategoriaID INT,
    DataCriacao DATETIME DEFAULT CURRENT_TIMESTAMP,
    DataAtualizacao DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    UsuarioAtualizacao INT,
    Ativo TINYINT(1) DEFAULT 1,
    INDEX idx_nome_descricao (Nome, Descricao), -- Adiciona índice nas colunas Nome e Descricao
    CONSTRAINT fk_categoria_produto FOREIGN KEY (CategoriaID) REFERENCES Categoria(CategoriaID)
);

-- Tabela Cliente
CREATE TABLE IF NOT EXISTS Cliente (
    ClienteID INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Email VARCHAR(100),
    Telefone VARCHAR(20),
    DataCriacao DATETIME DEFAULT CURRENT_TIMESTAMP,
    DataAtualizacao DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    UsuarioAtualizacao INT,
    Ativo TINYINT(1) DEFAULT 1,
    INDEX idx_nome_descricao (Nome) -- Adiciona índice nas colunas Nome
);

-- Tabela Pedido
CREATE TABLE IF NOT EXISTS Pedido (
    PedidoID INT AUTO_INCREMENT PRIMARY KEY,
    ClienteID INT,
    DataPedido DATETIME,
    FormaPagamentoID INT,
    Status VARCHAR(50),
    DataCriacao DATETIME DEFAULT CURRENT_TIMESTAMP,
    DataAtualizacao DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    UsuarioAtualizacao INT,
    FOREIGN KEY (ClienteID) REFERENCES Cliente(ClienteID),
    FOREIGN KEY (FormaPagamentoID) REFERENCES FormaPagamento(FormaPagamentoID)
);

-- Tabela ItemPedido
CREATE TABLE IF NOT EXISTS ItemPedido (
    ItemPedidoID INT AUTO_INCREMENT PRIMARY KEY,
    PedidoID INT,
    ProdutoID INT,
    Quantidade INT,
    DataCriacao DATETIME DEFAULT CURRENT_TIMESTAMP,
    DataAtualizacao DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    UsuarioAtualizacao INT,
    FOREIGN KEY (PedidoID) REFERENCES Pedido(PedidoID),
    FOREIGN KEY (ProdutoID) REFERENCES Produto(ProdutoID)
);

-- Tabela GrupoUsuario
CREATE TABLE IF NOT EXISTS GrupoUsuario (
    GrupoUsuarioID INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Descricao TEXT,
    DataCriacao DATETIME DEFAULT CURRENT_TIMESTAMP,
    DataAtualizacao DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    UsuarioAtualizacao INT,
    Ativo TINYINT(1) DEFAULT 1
);

-- Tabela Permissao
CREATE TABLE IF NOT EXISTS Permissao (
    PermissaoID INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Descricao TEXT,
    DataCriacao DATETIME DEFAULT CURRENT_TIMESTAMP,
    DataAtualizacao DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    UsuarioAtualizacao INT,
    Ativo TINYINT(1) DEFAULT 1
);

-- Tabela PermissaoGrupo
CREATE TABLE IF NOT EXISTS PermissaoGrupo (
    PermissaoID INT,
    GrupoUsuarioID INT,
    PRIMARY KEY (PermissaoID, GrupoUsuarioID),
    FOREIGN KEY (PermissaoID) REFERENCES Permissao(PermissaoID),
    FOREIGN KEY (GrupoUsuarioID) REFERENCES GrupoUsuario(GrupoUsuarioID)
);

-- Tabela Usuario
CREATE TABLE IF NOT EXISTS Usuario (
    UsuarioID INT AUTO_INCREMENT PRIMARY KEY,
    NomeUsuario VARCHAR(50) NOT NULL,
    Senha VARCHAR(100) NOT NULL,
    Email VARCHAR(100),
    GrupoUsuarioID INT,
    Ativo TINYINT(1) DEFAULT 1,
    DataCriacao DATETIME DEFAULT CURRENT_TIMESTAMP,
    DataAtualizacao DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    UsuarioAtualizacao INT,
    UNIQUE (NomeUsuario), -- Restrição UNIQUE na coluna NomeUsuario
    UNIQUE (Email), -- Restrição UNIQUE na coluna Email
    FOREIGN KEY (GrupoUsuarioID) REFERENCES GrupoUsuario(GrupoUsuarioID)
);