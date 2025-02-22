# DETRAN

O DETRAN deseja estabelecer um banco de dados para monitorar as infrações ocorridas no estado.

## MER

> Modelo Entidade Relacionamento (MER) é uma representação conceitual de um banco de dados. O MER é uma ferramenta para modelar a estrutura de um banco de dados, representando as entidades, atributos e relacionamentos entre as entidades.

### Entidades

- VEICULO
- MODELO
- CATEGORIA
- PROPRIETARIO
- INFRAÇÃO
- TIPOINFRACAO
- LOCAL
- AGENTETRANSITO

### Atributos

- VEICULO (**placa**, chassi, cor, ano, _modelo_, _categoria_)
- MODELO (**idModelo**, nomeModelo)
- CATEGORIA (**idCategoria**, nomeCategoria)
- PROPRIETARIO (**cpf**, nome, sexo, dataNascimento-, endereco(estado, cidade, bairro), telefone\*)
- INFRAÇÃO (**idInfrcao**, _placa_, data, hora, detalhe(_local_, velocidade, _agenteTransito_) _tipoInfracao_)
- TIPOINFRACAO (**idTipoInfracao**, descricao, valorMulta)
- LOCAL (**idLocal**, latitude, longitude, velocidadePermitida)
- AGENTETRANSITO (**matricula**, nome, dataContratacao)

### Relacionamentos

- **PROPRIETARIO – VEICULO (1:N)**
  Cada **PROPRIETARIO** pode possuir vários **VEICULO**, mas cada **VEICULO** possui somente um **PROPRIETARIO**.  
  _Chave estrangeira:_ **PROPRIETARIO.cpf** referenciada em **VEICULO**.

- **MODELO – VEICULO (1:N)**  
  Cada **MODELO** pode ser associado a vários **VEICULO**, mas cada **VEICULO** possui somente um **MODELO**.  
  _Chave estrangeira:_ **MODELO.idModelo** referenciada em **VEICULO** (_modelo_).

- **CATEGORIA – VEICULO (1:N)**  
  Cada **CATEGORIA** pode classificar vários **VEICULO**, mas cada **VEICULO** possui somente uma **CATEGORIA**.  
  _Chave estrangeira:_ **CATEGORIA.idCategoria** referenciada em **VEICULO** (_categoria_).

- **VEICULO – INFRAÇÃO (1:N)**  
  Cada **VEICULO** pode ter várias **INFRAÇÃO** registradas, porém cada **INFRAÇÃO** está vinculada a um único **VEICULO**.  
  _Chave estrangeira:_ **VEICULO.placa** referenciada em **INFRAÇÃO** (placa).

- **TIPOINFRACAO – INFRAÇÃO (1:N)**  
  Cada **TIPOINFRACAO** pode ser associado a diversas **INFRAÇÃO**, mas cada **INFRAÇÃO** possui somente um **TIPOINFRACAO**.  
  _Chave estrangeira:_ **TIPOINFRACAO.idTipoInfracao** referenciada em **INFRAÇÃO** (_tipoInfracao_).

- **LOCAL – INFRAÇÃO (1:N)**  
  Cada **LOCAL** pode ser o cenário de várias **INFRAÇÃO**, entretanto, cada **INFRAÇÃO** ocorre em um único **LOCAL**.  
  _Chave estrangeira:_ **LOCAL.idLocal** referenciada em **INFRAÇÃO** (dentro de detalhe - _local_).

- **AGENTETRANSITO – INFRAÇÃO (1:N)**  
  Cada **AGENTETRANSITO** pode registrar diversas **INFRAÇÃO**, mas cada **INFRAÇÃO** é registrada por apenas um **AGENTETRANSITO**.  
  _Chave estrangeira:_ **AGENTETRANSITO.matricula** referenciada em **INFRAÇÃO** (dentro de detalhe - _agenteTransito_).

### Legenda

| Símbolo      | Significado              |
| ------------ | ------------------------ |
| **Negrito**  | `PK`                     |
| _Italico_    | `FK`                     |
| (Parenteses) | `Atributo composto`      |
| \*           | `Atributo Multivalorado` |
| \-           | `Atributo Derivado`      |
