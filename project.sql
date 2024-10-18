CREATE DATABASE JogoClãDB;
USE JogoClãDB;

-- Tabela Jogador
CREATE TABLE Jogador (
    ID_Jogador INT AUTO_INCREMENT PRIMARY KEY,
    Nome_Jogador VARCHAR(255),
    Data_Entrada DATE,
    Ultima_Pontuacao INT
);

-- Tabela Ataque
CREATE TABLE Ataque (
    ID_Ataque INT AUTO_INCREMENT PRIMARY KEY,
    ID_Jogador INT,
    N_Ataques INT,
    Pontuacao INT,
    FOREIGN KEY (ID_Jogador) REFERENCES Jogador(ID_Jogador)
);

-- Tabela Clã
CREATE TABLE Cla (
    ID_Cla INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(255),
    Data_Criacao DATE,
    Liga VARCHAR(255)
);

-- Tabela Evento
CREATE TABLE Evento (
    ID_Evento INT AUTO_INCREMENT PRIMARY KEY,
    Tipo VARCHAR(255),
    N_Semana INT,
    Pontuacao_Total INT
);

-- Tabela Relacionamento Jogador_Cla
CREATE TABLE Jogador_Cla (
    ID_Jogador INT,
    ID_Cla INT,
    PRIMARY KEY (ID_Jogador, ID_Cla),
    FOREIGN KEY (ID_Jogador) REFERENCES Jogador(ID_Jogador),
    FOREIGN KEY (ID_Cla) REFERENCES Cla(ID_Cla)
);

-- Tabela Relacionamento Cla_Evento
CREATE TABLE Cla_Evento (
    ID_Cla INT,
    ID_Evento INT,
    PRIMARY KEY (ID_Cla, ID_Evento),
    FOREIGN KEY (ID_Cla) REFERENCES Cla(ID_Cla),
    FOREIGN KEY (ID_Evento) REFERENCES Evento(ID_Evento)
);
-- Inserindo dados na tabela Jogador
INSERT INTO Jogador (Nome_Jogador, Data_Entrada, Ultima_Pontuacao)
VALUES ('Jogador1', '2023-01-01', 100), ('Jogador2', '2023-02-01', 200);

-- Inserindo dados na tabela Ataque
INSERT INTO Ataque (ID_Jogador, N_Ataques, Pontuacao)
VALUES (1, 10, 50), (2, 5, 20);

-- Inserindo dados na tabela Cla
INSERT INTO Cla (Nome, Data_Criacao, Liga)
VALUES ('Cla1', '2022-01-01', 'Liga1'), ('Cla2', '2022-02-01', 'Liga2');

-- Inserindo dados na tabela Evento
INSERT INTO Evento (Tipo, N_Semana, Pontuacao_Total)
VALUES ('Evento1', 1, 1000), ('Evento2', 2, 2000);

-- Relacionamento Jogador_Cla
INSERT INTO Jogador_Cla (ID_Jogador, ID_Cla)
VALUES (1, 1), (2, 1);

-- Relacionamento Cla_Evento
INSERT INTO Cla_Evento (ID_Cla, ID_Evento)
VALUES (1, 1), (1, 2);
select * from Ataque;