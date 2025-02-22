-- Active: 1740229763499@@127.0.0.1@3306@mydatabase
-- Tabela TELEFONE
CREATE TABLE IF NOT EXISTS TELEFONE (
    idTelefone INT AUTO_INCREMENT PRIMARY KEY,
    numero VARCHAR(15) NOT NULL
);

-- Tabela PROPRIETARIO
CREATE TABLE IF NOT EXISTS PROPRIETARIO (
    cpf VARCHAR(11) PRIMARY KEY,
    primeiroNome VARCHAR(50) NOT NULL,
    sobrenome VARCHAR(50) NOT NULL,
    sexo ENUM('M', 'F') NOT NULL,
    dataNascimento DATE NOT NULL,
    estado ENUM(
        'AC',
        'AL',
        'AP',
        'AM',
        'BA',
        'CE',
        'DF',
        'ES',
        'GO',
        'MA',
        'MT',
        'MS',
        'MG',
        'PA',
        'PB',
        'PR',
        'PE',
        'PI',
        'RJ',
        'RN',
        'RS',
        'RO',
        'RR',
        'SC',
        'SP',
        'SE',
        'TO'
    ) NOT NULL,
    cidade VARCHAR(50) NOT NULL,
    bairro VARCHAR(50) NOT NULL,
    idTelefone INT NOT NULL,
    CONSTRAINT fk_telefone FOREIGN KEY (idTelefone) REFERENCES TELEFONE (idTelefone)
);

-- Tabela MODELO
CREATE TABLE IF NOT EXISTS MODELO (
    idModelo INT AUTO_INCREMENT PRIMARY KEY, -- tratamento de 6 digitos será feito pela view.
    nome VARCHAR(50) NOT NULL
    -- Coluna gerada para exibir o id com 6 dígitos (zeros à esquerda)
    -- idModeloFormatado CHAR(6) AS (LPAD(idModelo, 6, '0')) VIRTUAL,
    -- CONSTRAINT chk_id_6digits CHECK (idModelo < 1000000)
) AUTO_INCREMENT = 1;

-- Tabela CATEGORIA
CREATE TABLE IF NOT EXISTS CATEGORIA (
    idCategoria INT AUTO_INCREMENT PRIMARY KEY, -- tratamento de 2 digitos será feito pela view.
    nome VARCHAR(50) NOT NULL
    -- Coluna gerada para exibir o id com 2 dígitos (zeros à esquerda)
    -- idCategoriaFormatado CHAR(2) AS (LPAD(idCategoria, 2, '0')) VIRTUAL,
    -- CONSTRAINT chk_id_2digits CHECK (idCategoria < 100)
) AUTO_INCREMENT = 1;

-- Tabela VEICULO
CREATE TABLE IF NOT EXISTS VEICULO (
    placa VARCHAR(7) PRIMARY KEY,
    chassi VARCHAR(17) NOT NULL UNIQUE,
    cor VARCHAR(20) NOT NULL,
    ano INT NOT NULL,
    idModelo INT NOT NULL,
    idCategoria INT NOT NULL,
    cpfProprietario VARCHAR(11) NOT NULL,
    CONSTRAINT fk_categoria FOREIGN KEY (idCategoria) REFERENCES CATEGORIA (idCategoria),
    CONSTRAINT fk_modelo FOREIGN KEY (idModelo) REFERENCES MODELO (idModelo),
    CONSTRAINT fk_proprietario FOREIGN KEY (cpfProprietario) REFERENCES PROPRIETARIO (cpf)
);

-- Tabela LOCAL
CREATE TABLE IF NOT EXISTS LOCAL (
    idLocal INT AUTO_INCREMENT PRIMARY KEY,
    latitude DECIMAL(10, 8) NOT NULL,
    longitude DECIMAL(11, 8) NOT NULL,
    CONSTRAINT chk_latitude CHECK (latitude BETWEEN -90 AND 90),
    CONSTRAINT chk_longitude CHECK (
        longitude BETWEEN -180 AND 180
    ),
    CONSTRAINT uq_lat_long UNIQUE (latitude, longitude)
) AUTO_INCREMENT = 1;

-- Tabela AGENTE
CREATE TABLE IF NOT EXISTS AGENTE (
    matricula INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    dataContratacao DATE NOT NULL
) AUTO_INCREMENT = 1;

-- Tabela TIPOINFRACAO
CREATE TABLE IF NOT EXISTS TIPOINFRACAO (
    idTipoInfracao INT AUTO_INCREMENT PRIMARY KEY,
    descricao VARCHAR(100) NOT NULL,
    valor DECIMAL(10, 2) NOT NULL,
    CONSTRAINT chk_valor CHECK (valor > 0)
) AUTO_INCREMENT = 1;

-- Tabela INFRACAO
CREATE TABLE IF NOT EXISTS INFRACAO (
    idInfracao INT AUTO_INCREMENT PRIMARY KEY,
    placa VARCHAR(7) NOT NULL,
    idLocal INT NOT NULL,
    matriculaAgente INT NOT NULL,
    idTipoInfracao INT NOT NULL,
    dataInfracao DATE NOT NULL,
    horaInfracao TIME NOT NULL,
    CONSTRAINT fk_placa FOREIGN KEY (placa) REFERENCES VEICULO (placa),
    CONSTRAINT fk_idLocal FOREIGN KEY (idLocal) REFERENCES LOCAL (idLocal),
    CONSTRAINT fk_matriculaAgente FOREIGN KEY (matriculaAgente) REFERENCES AGENTE (matricula),
    CONSTRAINT fk_idTipoInfracao FOREIGN KEY (idTipoInfracao) REFERENCES TIPOINFRACAO (idTipoInfracao)
);