--CREATE DATABASE ControleFinanceiro;
--USE ControleFinanceiro;

--CREATE TABLE Usuario (
--    Id INT IDENTITY(1,1) PRIMARY KEY,
--    Nome NVARCHAR(100) NOT NULL,
--    Email NVARCHAR(100) NOT NULL UNIQUE,
--    Senha NVARCHAR(255) NOT NULL,
--    DataFim DATETIME NULL, 
--    DataCriacao DATETIME NOT NULL DEFAULT GETDATE(),
--    DataAtualizacao DATETIME NULL);

--CREATE TABLE TipoMovimentacao (
--    Id INT IDENTITY(1,1) PRIMARY KEY,
--    Codigo NVARCHAR(50) NOT NULL UNIQUE, 
--    Descricao NVARCHAR(100) NOT NULL);

--INSERT INTO TipoMovimentacao (Codigo, Descricao)
--VALUES 
--    ('REC', 'Receita'),
--    ('DESP', 'Despesa');

--CREATE TABLE Movimentacao (
--    Id INT IDENTITY(1,1) PRIMARY KEY,
--    Titulo NVARCHAR(100) NOT NULL,
--    Valor DECIMAL(18, 2) NOT NULL,
--    IdTipoMovimentacao INT NOT NULL, 
--    DataMovimentacao DATETIME NOT NULL,
--    DataFim DATETIME NULL, 
--    DataCriacao DATETIME NOT NULL DEFAULT GETDATE(),
--    DataAtualizacao DATETIME NULL,
--    FOREIGN KEY (IdTipoMovimentacao) REFERENCES TipoMovimentacao(Id));

--CREATE TRIGGER trgAtualizaMovimentacao
--ON Movimentacao
--AFTER UPDATE
--AS
--BEGIN
--    UPDATE Movimentacao
--    SET DataAtualizacao = GETDATE()
--    WHERE Id IN (SELECT DISTINCT Id FROM Inserted);
--END;

SELECT * FROM Usuario;
SELECT * FROM TipoMovimentacao;
SELECT * FROM Movimentacao;
