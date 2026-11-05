-- =====================================================================
-- MASSA DE DADOS FICTÍCIA E COERENTE - XENON MULTIMARCAS
-- Atende aos critérios de volume, variedade e LGPD (Seção 4 do Esqueleto)
-- =====================================================================

-- 1. CLIENTES (5 registros variados para simular o público-alvo)
INSERT INTO Cliente (nm_cliente, nr_cpf, nr_telefone, ds_email, ds_endereco) VALUES
('Carlos Alberto Silva', '12345678901', '11988887777', 'carlos.silva@email.com', 'Rua das Flores, 123 - São Paulo/SP'),
('Mariana Souza Costa', '98765432109', '11977776666', 'mariana.costa@email.com', 'Av. Paulista, 1000 - São Paulo/SP'),
('Lucas Pereira Lima', '45678912304', '11966665555', 'lucas.lima@email.com', 'Rua Augusta, 500 - São Paulo/SP'),
('Fernanda Rocha Ribeiro', '32165498702', '11955554444', 'fernanda.rocha@email.com', 'Alameda Santos, 200 - São Paulo/SP'),
('Rodrigo Alves Martins', '78912345605', '11944443333', 'rodrigo.alves@email.com', 'Rua Haddock Lobo, 800 - São Paulo/SP');

-- 2. FUNCIONÁRIOS (3 registros refletindo o porte enxuto da concessionária)
INSERT INTO Funcionario (nm_funcionario, nr_cpf, nr_telefone, ds_cargo) VALUES
('Roberto Mendes', '11122233344', '11933332222', 'Vendedor Sênior'),
('Ana Paula Lima', '55566677788', '11922221111', 'Gerente de Vendas'),
('Juliana Prado', '88899900011', '11911110000', 'Vendedora Pleno');

-- 3. VEÍCULOS (Variedade de status: Vendido, Disponível, Em Manutenção, Reservado)
INSERT INTO Veiculo (ds_chassi, nm_marca, nm_modelo, nr_ano, vl_preco, tp_veiculo, st_veiculo) VALUES
('9BWZZZ377VT001234', 'Chevrolet', 'Onix Plus', 2024, 85000.00, 'Sedan', 'Vendido'),
('93HZZZ255MK987654', 'Toyota', 'Corolla Cross', 2025, 160000.00, 'SUV', 'Vendido'),
('9BMZZZ488KL456789', 'Volkswagen', 'Nivus Highline', 2024, 125000.00, 'SUV', 'Disponível'),
('9FDRRR222MM112233', 'Ford', 'Ranger XLT', 2023, 210000.00, 'Pickup', 'Disponível'),
('9BGZZZ555NN334455', 'Fiat', 'Pulse Impetus', 2024, 105000.00, 'Hatch', 'Em Manutenção'),
('9ZZWWY111KK778899', 'Hyundai', 'Creta Limited', 2023, 115000.00, 'SUV', 'Reservado');

-- 4. BANCOS (Instituições financeiras parceiras para crédito)
INSERT INTO Banco (nm_banco, nr_cnpj, nr_telefone) VALUES
('Banco Itaú S.A.', '60701190000104', '08007280728'),
('Banco Santander Brasil', '90400888000142', '08007627777'),
('Banco Bradesco S.A.', '60746948000112', '08007048383');

-- 5. VENDAS (Cenários variados: uma financiada e outra à vista por PIX)
-- Venda 1: Financiada (Cliente 1, Vendedor 1, Veículo 2)
INSERT INTO Venda (dt_venda, vl_total, ds_forma_pagamento, st_venda, id_cliente, id_funcionario, id_veiculo) VALUES
('2026-10-15 14:30:00', 160000.00, 'Financiamento', 'Concluída', 1, 1, 2);

-- Venda 2: À Vista / PIX (Cliente 2, Vendedora 2, Veículo 1)
INSERT INTO Venda (dt_venda, vl_total, ds_forma_pagamento, st_venda, id_cliente, id_funcionario, id_veiculo) VALUES
('2026-10-20 11:00:00', 85000.00, 'PIX', 'Concluída', 2, 2, 1);

-- 6. FINANCIAMENTOS (Vinculado à venda 1 com o Banco Itaú)
INSERT INTO Financiamento (st_financiamento, qt_parcelas, vl_parcela, vl_financiado, id_banco, id_venda) VALUES
('Aprovado', 48, 3500.00, 130000.00, 1, 1);

-- 7. PEDIDOS DE VENDA (Documentação, nota fiscal e cartório)
INSERT INTO Pedido_de_venda (dt_pedido, nr_nota_fiscal, st_pedido, nm_cartorio, id_venda) VALUES
('2026-10-16 10:00:00', 'NF-98321', 'Faturado', '1º Cartório de Notas SP', 1),
('2026-10-20 14:00:00', 'NF-98322', 'Faturado', '3º Cartório de Títulos SP', 2);

-- 8. ENTREGAS (Controle logístico das vendas concluídas)
INSERT INTO Entrega (ds_endereco_entrega, st_entrega, dt_entrega, dt_prevista, id_pedido) VALUES
('Av. Paulista, 1000 - São Paulo/SP', 'Entregue', '2026-10-18 16:00:00', '2026-10-18', 1),
('Rua das Flores, 123 - São Paulo/SP', 'Entregue', '2026-10-22 10:30:00', '2026-10-22', 2);
