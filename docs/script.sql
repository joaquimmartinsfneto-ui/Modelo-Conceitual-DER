-- =====================================================================
-- PROJETO DE BANCO DE DADOS - XENON MULTIMARCAS
-- Artefato: Script SQL Completo (Entrega 2)
-- SGBD: MySQL
-- =====================================================================

-- 1. CRIACAO E SELECAO DO BANCO DE DADOS
DROP DATABASE IF EXISTS db_xenon_multimarcas;
CREATE DATABASE db_xenon_multimarcas CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE db_xenon_multimarcas;

-- =====================================================================
-- 2. CRIACAO DAS TABELAS INDEPENDENTES
-- =====================================================================

-- Tabela CLIENTE
CREATE TABLE Cliente (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nm_cliente VARCHAR(100) NOT NULL,
    nr_cpf VARCHAR(11) NOT NULL UNIQUE,
    nr_telefone VARCHAR(20) NOT NULL,
    ds_email VARCHAR(100),
    ds_endereco VARCHAR(255)
);

-- Tabela FUNCIONARIO
CREATE TABLE Funcionario (
    id_funcionario INT AUTO_INCREMENT PRIMARY KEY,
    nm_funcionario VARCHAR(100) NOT NULL,
    nr_cpf VARCHAR(11) NOT NULL UNIQUE,
    nr_telefone VARCHAR(20) NOT NULL,
    ds_cargo VARCHAR(50) NOT NULL
);

-- Tabela VEICULO
CREATE TABLE Veiculo (
    id_veiculo INT AUTO_INCREMENT PRIMARY KEY,
    ds_chassi VARCHAR(17) NOT NULL UNIQUE,
    nm_marca VARCHAR(50) NOT NULL,
    nm_modelo VARCHAR(50) NOT NULL,
    nr_ano INT NOT NULL,
    vl_preco DECIMAL(10, 2) NOT NULL CHECK (vl_preco > 0),
    tp_veiculo VARCHAR(30),
    st_veiculo VARCHAR(30) NOT NULL CHECK (st_veiculo IN ('Disponível', 'Vendido', 'Reservado', 'Em Manutenção'))
);

-- Tabela BANCO
CREATE TABLE Banco (
    id_banco INT AUTO_INCREMENT PRIMARY KEY,
    nm_banco VARCHAR(100) NOT NULL,
    nr_cnpj VARCHAR(14) NOT NULL UNIQUE,
    nr_telefone VARCHAR(20)
);

-- =====================================================================
-- 3. CRIACAO DAS TABELAS DEPENDENTES (COM CHAVES ESTRANGEIRAS)
-- =====================================================================

-- Tabela VENDA
CREATE TABLE Venda (
    id_venda INT AUTO_INCREMENT PRIMARY KEY,
    dt_venda DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    vl_total DECIMAL(10, 2) NOT NULL CHECK (vl_total > 0),
    ds_forma_pagamento VARCHAR(30) NOT NULL CHECK (ds_forma_pagamento IN ('À Vista', 'Financiamento', 'Cartão de Crédito', 'PIX', 'Misto')),
    st_venda VARCHAR(30) NOT NULL CHECK (st_venda IN ('Pendente', 'Aprovada', 'Concluída', 'Cancelada')),
    id_cliente INT NOT NULL,
    id_funcionario INT NOT NULL,
    id_veiculo INT NOT NULL UNIQUE,
    CONSTRAINT fk_venda_cliente FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente) ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT fk_venda_funcionario FOREIGN KEY (id_funcionario) REFERENCES Funcionario(id_funcionario) ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT fk_venda_veiculo FOREIGN KEY (id_veiculo) REFERENCES Veiculo(id_veiculo) ON DELETE RESTRICT ON UPDATE CASCADE
);

-- Tabela FINANCIAMENTO
CREATE TABLE Financiamento (
    id_financiamento INT AUTO_INCREMENT PRIMARY KEY,
    st_financiamento VARCHAR(30) NOT NULL CHECK (st_financiamento IN ('Em Análise', 'Aprovado', 'Recusado', 'Cancelado')),
    qt_parcelas INT NOT NULL CHECK (qt_parcelas > 0),
    vl_parcela DECIMAL(10, 2) NOT NULL CHECK (vl_parcela > 0),
    vl_financiado DECIMAL(10, 2) NOT NULL CHECK (vl_financiado > 0),
    id_banco INT NOT NULL,
    id_venda INT NOT NULL UNIQUE,
    CONSTRAINT fk_financiamento_banco FOREIGN KEY (id_banco) REFERENCES Banco(id_banco) ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT fk_financiamento_venda FOREIGN KEY (id_venda) REFERENCES Venda(id_venda) ON DELETE RESTRICT ON UPDATE CASCADE
);

-- Tabela PEDIDO_DE_VENDA
CREATE TABLE Pedido_de_venda (
    id_pedido INT AUTO_INCREMENT PRIMARY KEY,
    dt_pedido DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    nr_nota_fiscal VARCHAR(50),
    st_pedido VARCHAR(30) NOT NULL CHECK (st_pedido IN ('Em Processamento', 'Aguardando Emissão', 'Faturado', 'Cancelado')),
    nm_cartorio VARCHAR(100),
    id_venda INT NOT NULL UNIQUE,
    CONSTRAINT fk_pedido_venda FOREIGN KEY (id_venda) REFERENCES Venda(id_venda) ON DELETE RESTRICT ON UPDATE CASCADE
);

-- Tabela ENTREGA
CREATE TABLE Entrega (
    id_entrega INT AUTO_INCREMENT PRIMARY KEY,
    ds_endereco_entrega VARCHAR(255),
    st_entrega VARCHAR(30) NOT NULL CHECK (st_entrega IN ('Agendada', 'Em Preparação', 'Pronto para Retirada', 'Entregue', 'Cancelada')),
    dt_entrega DATETIME,
    dt_prevista DATE NOT NULL,
    id_pedido INT NOT NULL UNIQUE,
    CONSTRAINT fk_entrega_pedido FOREIGN KEY (id_pedido) REFERENCES Pedido_de_venda(id_pedido) ON DELETE RESTRICT ON UPDATE CASCADE
);

-- =====================================================================
-- 4. CARGA DA MASSA DE DADOS (INSERT INTO)
-- =====================================================================

INSERT INTO Cliente (nm_cliente, nr_cpf, nr_telefone, ds_email, ds_endereco) VALUES
('Carlos Alberto Silva', '12345678901', '11988887777', 'carlos.silva@email.com', 'Rua das Flores, 123 - São Paulo/SP'),
('Mariana Souza Costa', '98765432109', '11977776666', 'mariana.costa@email.com', 'Av. Paulista, 1000 - São Paulo/SP'),
('Lucas Pereira Lima', '45678912304', '11966665555', 'lucas.lima@email.com', 'Rua Augusta, 500 - São Paulo/SP'),
('Fernanda Rocha Ribeiro', '32165498702', '11955554444', 'fernanda.rocha@email.com', 'Alameda Santos, 200 - São Paulo/SP'),
('Rodrigo Alves Martins', '78912345605', '11944443333', 'rodrigo.alves@email.com', 'Rua Haddock Lobo, 800 - São Paulo/SP');

INSERT INTO Funcionario (nm_funcionario, nr_cpf, nr_telefone, ds_cargo) VALUES
('Roberto Mendes', '11122233344', '11933332222', 'Vendedor Sênior'),
('Ana Paula Lima', '55566677788', '11922221111', 'Gerente de Vendas'),
('Juliana Prado', '88899900011', '11911110000', 'Vendedora Pleno');

INSERT INTO Veiculo (ds_chassi, nm_marca, nm_modelo, nr_ano, vl_preco, tp_veiculo, st_veiculo) VALUES
('9BWZZZ377VT001234', 'Chevrolet', 'Onix Plus', 2024, 85000.00, 'Sedan', 'Vendido'),
('93HZZZ255MK987654', 'Toyota', 'Corolla Cross', 2025, 160000.00, 'SUV', 'Vendido'),
('9BMZZZ488KL456789', 'Volkswagen', 'Nivus Highline', 2024, 125000.00, 'SUV', 'Disponível'),
('9FDRRR222MM112233', 'Ford', 'Ranger XLT', 2023, 210000.00, 'Pickup', 'Disponível'),
('9BGZZZ555NN334455', 'Fiat', 'Pulse Impetus', 2024, 105000.00, 'Hatch', 'Em Manutenção');

INSERT INTO Banco (nm_banco, nr_cnpj, nr_telefone) VALUES
('Banco Itaú S.A.', '60701190000104', '08007280728'),
('Banco Santander Brasil', '90400888000142', '08007627777'),
('Banco Bradesco S.A.', '60746948000112', '08007048383');

-- Venda 1 (Financiada / Concluída)
INSERT INTO Venda (dt_venda, vl_total, ds_forma_pagamento, st_venda, id_cliente, id_funcionario, id_veiculo) VALUES
('2026-10-15 14:30:00', 160000.00, 'Financiamento', 'Concluída', 1, 1, 2);

-- Venda 2 (À Vista / Concluída)
INSERT INTO Venda (dt_venda, vl_total, ds_forma_pagamento, st_venda, id_cliente, id_funcionario, id_veiculo) VALUES
('2026-10-20 11:00:00', 85000.00, 'PIX', 'Concluída', 2, 2, 1);

-- Financiamento para Venda 1
INSERT INTO Financiamento (st_financiamento, qt_parcelas, vl_parcela, vl_financiado, id_banco, id_venda) VALUES
('Aprovado', 48, 3500.00, 130000.00, 1, 1);

-- Pedidos de Venda
INSERT INTO Pedido_de_venda (dt_pedido, nr_nota_fiscal, st_pedido, nm_cartorio, id_venda) VALUES
('2026-10-16 10:00:00', 'NF-98321', 'Faturado', '1º Cartório de Notas SP', 1),
('2026-10-20 14:00:00', 'NF-98322', 'Faturado', '3º Cartório de Títulos SP', 2);

-- Entregas
INSERT INTO Entrega (ds_endereco_entrega, st_entrega, dt_entrega, dt_prevista, id_pedido) VALUES
('Av. Paulista, 1000 - São Paulo/SP', 'Entregue', '2026-10-18 16:00:00', '2026-10-18', 1),
('Rua das Flores, 123 - São Paulo/SP', 'Entregue', '2026-10-22 10:30:00', '2026-10-22', 2);

-- =====================================================================
-- 5. COMANDOS DE MANIPULACAO (UPDATE E DELETE)
-- =====================================================================

-- Exemplo de UPDATE: Atualizando o status de um veículo em estoque
UPDATE Veiculo 
SET st_veiculo = 'Reservado' 
WHERE id_veiculo = 3;

-- Exemplo de DELETE: Removendo cliente sem histórico de vendas
DELETE FROM Cliente 
WHERE id_cliente = 5 
  AND id_cliente NOT IN (SELECT id_cliente FROM Venda);

-- =====================================================================
-- 6. CONSULTAS GERENCIAIS (G01 - G04)
-- =====================================================================

-- G01: Quais veículos estão disponíveis no estoque para venda?
-- Atende: P1 (Ruptura e falta de controle do estoque)
SELECT id_veiculo, ds_chassi, nm_marca, nm_modelo, nr_ano, vl_preco, tp_veiculo
FROM Veiculo
WHERE st_veiculo = 'Disponível';

-- G02: Qual o faturamento total acumulado e a média por venda (Ticket Médio)?
-- Atende: KPI - Ticket Médio por Venda
SELECT 
    COUNT(id_venda) AS total_vendas_realizadas,
    SUM(vl_total) AS faturamento_total,
    AVG(vl_total) AS ticket_medio
FROM Venda
WHERE st_venda = 'Concluída';

-- G03: Qual o desempenho de vendas por cada funcionário?
-- Atende: KPI - Desempenho e Comissões da Equipe de Vendas
SELECT 
    f.nm_funcionario,
    f.ds_cargo,
    COUNT(v.id_venda) AS qtd_veiculos_vendidos,
    COALESCE(SUM(v.vl_total), 0.00) AS total_vendido
FROM Funcionario f
LEFT JOIN Venda v ON f.id_funcionario = v.id_funcionario AND v.st_venda = 'Concluída'
GROUP BY f.id_funcionario, f.nm_funcionario, f.ds_cargo
ORDER BY total_vendido DESC;

-- G04: Relatório completo de trâmite de entregas de veículos comercializados
-- Atende: P2 (Desorganização de entregas e documentação cartorária)
SELECT 
    v.id_venda,
    c.nm_cliente,
    ve.nm_marca,
    ve.nm_modelo,
    pv.nr_nota_fiscal,
    e.st_entrega,
    e.dt_prevista,
    e.dt_entrega
FROM Venda v
JOIN Cliente c ON v.id_cliente = c.id_cliente
JOIN Veiculo ve ON v.id_veiculo = ve.id_veiculo
JOIN Pedido_de_venda pv ON v.id_venda = pv.id_venda
JOIN Entrega e ON pv.id_pedido = e.id_pedido;

-- =====================================================================
-- 7. CONSULTAS DE AUDITORIA (A01 - A03)
-- =====================================================================

-- A01: Existe algum registro de venda sem um funcionário válido cadastrado?
-- Verifica: RN01 (Toda venda deve ser intermediada por um funcionário)
SELECT v.id_venda, v.dt_venda, v.vl_total
FROM Venda v
LEFT JOIN Funcionario f ON v.id_funcionario = f.id_funcionario
WHERE f.id_funcionario IS NULL;

-- A02: Existe algum veículo vendido que não possua Pedido de Venda associado?
-- Verifica: RN04 (Toda venda concluída gera obrigatoriamente um pedido de venda)
SELECT v.id_venda, ve.nm_modelo, v.st_venda
FROM Venda v
JOIN Veiculo ve ON v.id_veiculo = ve.id_veiculo
LEFT JOIN Pedido_de_venda pv ON v.id_venda = pv.id_venda
WHERE v.st_venda = 'Concluída' AND pv.id_pedido IS NULL;

-- A03: Existe financiamento registrado para vendas com forma de pagamento à vista/PIX?
-- Verifica: RN03 (Financiamento só deve existir para pagamentos em Financiamento/Misto)
SELECT f.id_financiamento, v.id_venda, v.ds_forma_pagamento
FROM Financiamento f
JOIN Venda v ON f.id_venda = v.id_venda
WHERE v.ds_forma_pagamento NOT IN ('Financiamento', 'Misto');
