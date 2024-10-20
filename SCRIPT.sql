--CREATE DATABASE Controle_Financeiro;
--USE Controle_Financeiro;

--CREATE TABLE Usuario (
--    Id INT IDENTITY(1,1) PRIMARY KEY,
--    CPF VARCHAR(14) NOT NULL UNIQUE,
--    Nome NVARCHAR(250) NOT NULL,
--    Email NVARCHAR(100) NOT NULL UNIQUE,
--    Senha NVARCHAR(255) NOT NULL,
--    DataNascimento DATE NOT NULL,
--    Sexo CHAR(1) NOT NULL CHECK (Sexo IN ('M', 'F')),
--    DataCriacao DATETIME NOT NULL DEFAULT GETDATE(),
--    DataAtualizacao DATETIME NULL,
--    DataFim DATETIME NULL
--);

--INSERT INTO Usuario (CPF, Nome, Email, Senha, DataNascimento, Sexo) VALUES
--('123.456.789-00', 'João Silva', 'joao.silva@email.com', 'senha123', '1990-01-01', 'M'),
--('234.567.890-11', 'Maria Souza', 'maria.souza@email.com', 'senha123', '1992-02-15', 'F'),
--('345.678.901-22', 'Carlos Lima', 'carlos.lima@email.com', 'senha123', '1985-03-20', 'M'),
--('456.789.012-33', 'Ana Costa', 'ana.costa@email.com', 'senha123', '1995-04-10', 'F'),
--('567.890.123-44', 'Lucas Pereira', 'lucas.pereira@email.com', 'senha123', '1998-05-30', 'M');

--SELECT * FROM Usuario;

--CREATE TABLE TipoMovimentacao (
--    Id INT IDENTITY(1,1) PRIMARY KEY,
--    Codigo NVARCHAR(50) NOT NULL UNIQUE, 
--    Descricao NVARCHAR(100) NOT NULL
--);

--INSERT INTO TipoMovimentacao (Codigo, Descricao)
--VALUES 
--    ('REC', 'Receita'),
--    ('DESP', 'Despesa');

--CREATE TABLE Movimentacao (
--    Id INT IDENTITY(1,1) PRIMARY KEY,
--    UsuarioId INT NOT NULL,
--    Categoria NVARCHAR(100) NOT NULL,
--    Valor DECIMAL(18, 2) NOT NULL,
--    IdTipoMovimentacao INT NOT NULL, 
--    DataMovimentacao DATE NOT NULL,
--    DataPrevista DATE NULL,
--    Descricao NVARCHAR(250) NOT NULL,
--    DataCriacao DATETIME NOT NULL DEFAULT GETDATE(),
--    DataFim DATETIME NULL,
--    DataAtualizacao DATETIME NULL,
--    FOREIGN KEY (UsuarioId) REFERENCES usuario(id),
--    FOREIGN KEY (IdTipoMovimentacao) REFERENCES TipoMovimentacao(Id)
--);

--CREATE TRIGGER trgAtualizaMovimentacao
--ON Movimentacao
--AFTER UPDATE
--AS
--BEGIN
--    UPDATE Movimentacao
--    SET DataAtualizacao = GETDATE()
--    WHERE Id IN (SELECT DISTINCT Id FROM Inserted);
--END;

--INSERT INTO Movimentacao (UsuarioId, Categoria, Valor, IdTipoMovimentacao, DataMovimentacao, DataPrevista, Descricao)
--VALUES
--    (1, 'Salário', 3000.00, 1, '2024-10-01', '2024-10-01', 'Salário de Outubro'),
--    (2, 'Salário', 4500.00, 1, '2024-10-05', '2024-10-05', 'Salário de Outubro'),
--    (3, 'Salário', 2800.00, 1, '2024-10-10', '2024-10-10', 'Salário de Outubro'),
--    (4, 'Salário', 3500.00, 1, '2024-10-15', '2024-10-15', 'Salário de Outubro'),
--    (5, 'Salário', 4000.00, 1, '2024-10-20', '2024-10-20', 'Salário de Outubro');

--INSERT INTO Movimentacao (UsuarioId, Categoria, Valor, IdTipoMovimentacao, DataMovimentacao, Descricao)
--VALUES
--    (1, 'Alimentação', 200.00, 2, '2024-10-05', 'Compra de supermercado'),
--    (2, 'Alimentação', 150.00, 2, '2024-10-10', 'Jantar em restaurante'),
--    (3, 'Educação', 500.00, 2, '2024-10-15', 'Curso online'),
--    (4, 'Lazer', 300.00, 2, '2024-10-20', 'Cinema e lazer'),
--    (5, 'Transporte', 100.00, 2, '2024-10-25', 'Passagem de ônibus');

--SELECT * FROM Movimentacao;

--CREATE TABLE BalancoMensal (
--    id INTEGER PRIMARY KEY IDENTITY(1,1) NOT NULL,
--    usuario_id INTEGER NOT NULL,
--    FOREIGN KEY (usuario_id) REFERENCES usuario(id),
--    mes_referencia DATE NOT NULL,
--    receita_total DECIMAL(18, 2) NOT NULL,
--    despesas_totais DECIMAL(18, 2) NOT NULL,
--    saldo_inicial DECIMAL(18, 2) NOT NULL,
--    saldo_final DECIMAL(18, 2) NOT NULL
--);

--INSERT INTO BalancoMensal(usuario_id, mes_referencia, receita_total, despesas_totais, saldo_inicial, saldo_final) VALUES
--(1, '2024-09-01', 3000.00, 1500.00, 1000.00, 2500.00),
--(4, '2024-09-01', 4500.00, 2500.00, 500.00, 2500.00),
--(5, '2024-09-01', 2800.00, 1800.00, 1500.00, 2500.00),
--(3, '2024-09-01', 3500.00, 2000.00, 2000.00, 3500.00),
--(2, '2024-09-01', 4000.00, 2500.00, 800.00, 2300.00);

--CREATE TABLE OrcamentoMensal (
--    id INTEGER PRIMARY KEY IDENTITY(1,1) NOT NULL,
--    usuario_id INTEGER NOT NULL,
--    FOREIGN KEY (usuario_id) REFERENCES usuario(id),
--    mes_referencia DATE NOT NULL,
--    valor_orcamento DECIMAL NOT NULL,
--    valor_gasto DECIMAL NOT NULL,
--    data_criacao DATE NOT NULL,
--    data_atualizacao DATE NOT NULL
--);

--INSERT INTO OrcamentoMensal(usuario_id, mes_referencia, valor_orcamento, valor_gasto, data_criacao, data_atualizacao) VALUES
--(4, '2024-09-01', 500.00, 200.00, '2024-08-01', '2024-09-01'),
--(2, '2024-09-01', 800.00, 300.00, '2024-08-05', '2024-09-05'),
--(3, '2024-09-01', 1000.00, 500.00, '2024-08-10', '2024-09-10'),
--(1, '2024-09-01', 600.00, 400.00, '2024-08-15', '2024-09-15'),
--(5, '2024-09-01', 300.00, 100.00, '2024-08-20', '2024-09-20');

--CREATE TABLE Investimentos (
--    id INTEGER PRIMARY KEY IDENTITY(1,1) NOT NULL,
--    usuario_id INTEGER NOT NULL,
--    FOREIGN KEY (usuario_id) REFERENCES usuario(id),
--    tipo_investimento VARCHAR(100) NOT NULL,
--    valor_investido DECIMAL NOT NULL,
--    data_investido DATE NOT NULL,
--    valor_atual DECIMAL NOT NULL
--);

--INSERT INTO Investimentos(usuario_id, tipo_investimento, valor_investido, data_investido, valor_atual) VALUES
--(1, 'Ações', 2000.00, '2024-08-01', 2200.00),
--(2, 'CDB', 3000.00, '2024-08-05', 3100.00),
--(3, 'Fundos Imobiliários', 1500.00, '2024-08-10', 1600.00),
--(4, 'Tesouro Direto', 1000.00, '2024-08-15', 1050.00),
--(5, 'Poupança', 800.00, '2024-08-20', 820.00);

--CREATE TABLE MetasFinanceiras (
--    id INTEGER PRIMARY KEY IDENTITY(1,1) NOT NULL,
--    usuario_id INTEGER NOT NULL,
--    FOREIGN KEY (usuario_id) REFERENCES usuario(id),
--    descricao_meta VARCHAR(250) NOT NULL,
--    valor_meta DECIMAL NOT NULL,
--    valor_atual DECIMAL NOT NULL,
--    data_limite DATE NOT NULL
--);

--INSERT INTO MetasFinanceiras( usuario_id, descricao_meta, valor_meta, valor_atual, data_limite) VALUES
--(1, 'Comprar um carro', 30000.00, 5000.00, '2025-12-31'),
--(2, 'Viajar para Europa', 20000.00, 10000.00, '2025-06-30'),
--(3, 'Reformar a casa', 15000.00, 8000.00, '2025-10-31'),
--(4, 'Abrir um negócio', 50000.00, 20000.00, '2025-05-31'),
--(5, 'Pagar dívidas', 10000.00, 3000.00, '2025-03-31');

--ALTER TABLE Usuario
--ADD SenhaTemp VARBINARY(64);

--UPDATE Usuario
--SET SenhaTemp = HASHBYTES('SHA2_256', Senha);

--ALTER TABLE Usuario
--DROP COLUMN Senha;

--EXEC sp_rename 'Usuario.SenhaTemp', 'Senha', 'COLUMN';

--SELECT Id, Nome, Email, Senha
--FROM Usuario;

--CREATE TABLE HistoricoLogin (
--    Id INT IDENTITY(1,1) PRIMARY KEY,
--    UsuarioId INT NOT NULL,
--    DataLogin DATETIME NOT NULL DEFAULT GETDATE(),
--    IPAddress VARCHAR(45) NULL,
--    FOREIGN KEY (UsuarioId) REFERENCES Usuario(Id)
--);

--IF OBJECT_ID('dbo.AutenticarUsuario', 'P') IS NOT NULL
--    DROP PROCEDURE dbo.AutenticarUsuario;
--GO

--CREATE PROCEDURE AutenticarUsuario
--    @Email NVARCHAR(100),
--    @Senha NVARCHAR(255)
--AS
--BEGIN
--    DECLARE @UsuarioId INT;
--    DECLARE @SenhaHash VARBINARY(64);

--    -- Criar o hash da senha fornecida
--    SET @SenhaHash = HASHBYTES('SHA2_256', @Senha);

--    -- Verificar se o usuário existe e a senha hash está correta
--    SELECT @UsuarioId = Id
--    FROM Usuario
--    WHERE Email = @Email AND Senha = @SenhaHash;

--    IF @UsuarioId IS NOT NULL
--    BEGIN
--        -- Inserir no histórico de login
--        INSERT INTO HistoricoLogin (UsuarioId, IPAddress)
--        VALUES (@UsuarioId, NULL);  -- Aqui você pode adicionar o IP, se necessário

--        SELECT 'Login bem-sucedido' AS Mensagem, @UsuarioId AS UsuarioId;
--    END
--    ELSE
--    BEGIN
--        SELECT 'Email ou senha incorretos' AS Mensagem;
--    END
--END;

--TESTE
--EXEC AutenticarUsuario @Email = 'joao.silva@email.com', @Senha = 'senha123';