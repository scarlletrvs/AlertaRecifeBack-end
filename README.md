# API REST Alerta Recife

API Rest simples construida com Typescript, Node.js,Express, Prisma e SQLite

## Instalação

Como rodar o projeto na sua máquina

### 1. Clone o repositório.

```bash
  git clone https://github.com/sergiohdljr/AlertaRecifeBack-end.git
```

### 2. Instale as dependências

```bash
  cd AlertaRecifeBack-end/
  npm install
```

### 3. Iniciando o Servidor

```bash
  npm run dev
```

o servidor agora vai estar rodando na porta `http://localhost:3000`

## Usando a API

Você pode acessar a API do servidor usando os seguintes endpoints:

### `GET`

- `/ocorrencias`: Retorna todas as ocorrencias registradas e os usuários que cadastraram tal ocorrencia.

- `/ocorrencias/:email`: Retorna apenas as ocorrencias registradas pelo usuário
  - Params:
    - `email: String (required)`: e-mail do usuário que você deseja obter as ocorrencias.

### `POST`

- `/ocorrencia`: Registra uma nova ocorrencia.
  - Body:
    - `descricaoDaOcorrencia: String (required)`:Descrição da ocorrencia que deseja registrar
    - `latitude: Decimal (required)`:Latitude em tempo real de onde ocorreu aproximadamente a ocorrencia.
    - `longitude: Decimal (required)`:Longitude em tempo real de onde ocorreu aproximadamente a ocorrencia
    - `nome: String (required)`: Nome do usuário.
    - `email: String (required)`: Email do usuário.
    - `fotoPerfil: String (required)`: URL da foto do perfil do usuário.
