CREATE DATABASE IF NOT EXISTS loja;
USE loja;

-- Criação da tabela Clientes
CREATE TABLE Clientes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL
);

CREATE TABLE Pedido (
    id INT AUTO_INCREMENT PRIMARY KEY,
    data_pedido DATE NOT NULL,
    valor DECIMAL(10, 2) NOT NULL
);

-- Adicionar coluna telefone na tabela Clientes
ALTER TABLE Clientes
ADD COLUMN telefone VARCHAR(15);

-- Adicionar coluna status na tabela Pedido
ALTER TABLE Pedido
ADD COLUMN status VARCHAR(20);

desc Cliente_Info;
desc Pedido;

-- Modificar a coluna telefone na tabela Clientes para aumentar o tamanho para 20 caracteres
ALTER TABLE Clientes
MODIFY COLUMN telefone VARCHAR(20);

-- Renomear a coluna telefone para telefone_contato na tabela Clientes
ALTER TABLE Clientes
CHANGE COLUMN telefone telefone_contato VARCHAR(20);

-- Remover a coluna status da tabela Pedido
ALTER TABLE Pedido
DROP COLUMN status;

-- Renomear a tabela Clientes para Cliente_Info
ALTER TABLE Clientes
RENAME TO Cliente_Info;


-- LOAD DATA INFILE '/Users/suelenmapa/Documents/ArquivoMysql/dadosClientes.csv'
-- INTO TABLE Cliente_Info
-- FIELDS TERMINATED BY ',' -- Delimitador de campo
-- ENCLOSED BY '"' -- Opcional: Se os valores estiverem entre aspas
-- LINES TERMINATED BY '\n' -- Delimitador de linha
-- IGNORE 1 LINES -- Ignorar a primeira linha (cabeçalho)
-- (nome, email, telefone_contato); -- Mapeamento das colunas

-- SELECT @@GLOBAL.secure_file_priv;

select * from Cliente_Info;

alter table Pedido
add column idCliente int;

alter table Pedido
add foreign key (idCliente)
references Cliente_Info (id);

-- ALTER TABLE Pedido
-- ADD COLUMN idCliente INT,
-- ADD CONSTRAINT fk_cliente
-- FOREIGN KEY (idCliente) REFERENCES Cliente_Info(id);

desc Pedido;

INSERT INTO Pedido (data_pedido, valor, idCliente) VALUES
('2024-08-01', 300.75, 4),  -- Referencia o cliente com id 4
('2024-08-02', 150.25, 5),  -- Referencia o cliente com id 5
('2024-08-03', 200.00, 1),  -- Referencia o cliente com id 1
('2024-08-04', 350.50, 2),  -- Referencia o cliente com id 2
('2024-08-05', 120.00, 3),  -- Referencia o cliente com id 3
('2023-07-03', 100.99, 3),  -- Referencia o cliente com id 3
('2024-08-08', 120.00, 1),  -- Pedido 3 para o cliente com id 1
('2024-08-06', 300.00, 2);  -- Pedido 1 para o cliente com id 2

select * from Pedido;

select * from Cliente_Info;

delete from Cliente_Info
where id = 1;

