-- Apresentar todos os dados dos veículos de um determinado proprietário (informado pelo usuário através do CPF);
SELECT * FROM `VEICULO` WHERE `cpfProprietario` = '12345678901';

-- Consultar proprietário(s) por qualquer parte do nome;
SELECT *
FROM `PROPRIETARIO`
WHERE
    `primeiroNome` LIKE CONCAT('%', 'uno', '%')
    OR `sobrenome` LIKE CONCAT('%', 'os', '%');

-- Mostrar os dados da infração e do veículo que tiveram infrações cadastradas no Detran em um período (ou data) no padrão DE... ATÉ...;
SELECT i.`idInfracao`, i.`dataInfracao`, i.`horaInfracao`, i.`placa`, v.`chassi`, v.`cor`, v.`ano`, v.`idModelo`, v.`idCategoria`, v.`cpfProprietario`
FROM `INFRACAO` i
    JOIN `VEICULO` v ON i.`placa` = v.`placa`
WHERE
    i.`dataInfracao` BETWEEN '2023-01-01' AND '2023-01-31';

-- Pesquisar o número de veículos que foram cadastrados em cada modelo, ordenando pelo número de veículos em ordem decrescente;
SELECT m.`nome` AS `modelo`, COUNT(*) AS `total_veiculos`
FROM `VEICULO` v
    JOIN `MODELO` m ON v.`idModelo` = m.`idModelo`
GROUP BY
    m.`idModelo`,
    m.`nome`
ORDER BY `total_veiculos` DESC;