-- TELEFONE
INSERT INTO TELEFONE (numero) VALUES 
('11987654321'),
('21987654321'),
('31987654321'),
('41987654321'),
('51987654321');

-- PROPRIETARIO
INSERT INTO PROPRIETARIO (cpf, primeiroNome, sobrenome, sexo, dataNascimento, estado, cidade, bairro, idTelefone)
VALUES
('12345678901', 'Alice', 'Silva', 'F', '1985-05-10', 'SP', 'Sao Paulo', 'Centro', 1),
('23456789012', 'Bruno', 'Costa', 'M', '1990-07-15', 'RJ', 'Rio de Janeiro', 'Copacabana', 2),
('34567890123', 'Carla', 'Dias', 'F', '1978-03-22', 'MG', 'Belo Horizonte', 'Savassi', 3),
('45678901234', 'Daniel', 'Lima', 'M', '1988-11-30', 'RS', 'Porto Alegre', 'Moinhos de Vento', 4),
('56789012345', 'Elena', 'Rocha', 'F', '1995-09-05', 'BA', 'Salvador', 'Pelourinho', 5);

-- MODELO
INSERT INTO MODELO (nome) VALUES
('GOL MI'),
('GOL 1.8'),
('UNO CS'),
('PALIO'),
('CIVIC');

-- CATEGORIA
INSERT INTO CATEGORIA (nome) VALUES
('Automovel'),
('Motocicleta'),
('Caminhao'),
('Utilitario'),
('Onibus');

-- VEICULO
INSERT INTO VEICULO (placa, chassi, cor, ano, idModelo, idCategoria, cpfProprietario)
VALUES
('ABC1234', '9BWZZZ377VT004251', 'Vermelho', 2015, 1, 1, '12345678901'),
('DEF5678', '9BWZZZ377VT004252', 'Azul', 2017, 2, 2, '23456789012'),
('GHI9012', '9BWZZZ377VT004253', 'Preto', 2018, 3, 1, '34567890123'),
('JKL3456', '9BWZZZ377VT004254', 'Branco', 2016, 4, 4, '45678901234'),
('MNO7890', '9BWZZZ377VT004255', 'Cinza', 2020, 5, 1, '56789012345');

-- LOCAL
INSERT INTO LOCAL (latitude, longitude)
VALUES
(-23.55052000, -46.63330900), 
(-22.90684670, -43.17289650), 
(-19.91668130, -43.93449310), 
(-30.03464710, -51.21765820), 
(-12.97139820, -38.50130570); 

-- AGENTE
INSERT INTO AGENTE (nome, dataContratacao)
VALUES
('Lucas', '2010-01-15'),
('Marcos', '2012-06-20'),
('Antonio', '2015-09-10'),
('Fernanda', '2018-03-05'),
('Julia', '2020-12-01');

-- TIPOINFRACAO
INSERT INTO TIPOINFRACAO (descricao, valor)
VALUES
('Avanco de sinal vermelho', 150.00),
('Parada sobre faixa de pedestres', 200.00),
('Excesso de velocidade', 300.00),
('Estacionamento irregular', 100.00),
('Uso de celular ao dirigir', 250.00);

-- INFRACAO
INSERT INTO INFRACAO (placa, idLocal, matriculaAgente, idTipoInfracao, dataInfracao, horaInfracao)
VALUES
('ABC1234', 1, 1, 1, '2023-01-10', '08:30:00'),
('DEF5678', 2, 2, 2, '2023-01-11', '09:45:00'),
('GHI9012', 3, 3, 3, '2023-01-12', '10:15:00'),
('JKL3456', 4, 4, 4, '2023-01-13', '11:00:00'),
('MNO7890', 5, 5, 5, '2023-01-14', '12:30:00');
