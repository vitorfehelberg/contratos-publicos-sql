# Projeto SQL - Contratos Públicos Federais

![PostgreSQL](https://img.shields.io/badge/PostgreSQL-15.5-blue)
![Docker](https://img.shields.io/badge/Docker-OK-brightgreen)
![Status](https://img.shields.io/badge/Status-Em%20desenvolvimento-yellow)

## Sobre o Projeto
Este projeto visa aplicar e aprimorar conhecimentos em **SQL** utilizando dados públicos do governo federal brasileiro, fornecidos pelo portal [dados.gov.br](https://dados.gov.br).

O foco principal é explorar, transformar e analisar contratos públicos federais utilizando **SQL como ferramenta central**, aplicando **modelagem de dados, consultas analíticas e boas práticas de versionamento**.

## Principais Objetivos

- **Criar uma pipeline de dados em camadas**.
    - **Bronze**
        - Dados brutos, importados diretamente do CSV original, para garantir a rastreabilidade.
    - **Silver**
        - Dados limpos, padronizados e transformados, incluindo:
            - `silver.contracts` → contratos tratados e padronizados.
            - `silver.contracts_errors` → contratos que apresentaram erros no tratamento.
    - **Gold**
        - Dados agregados, prontos para o consumo e otimizados para consultas analíticas e dashboards.
- **Desenvolver consultas SQL** que gerem insights sobre os gastos públicos.
- **Estruturar o projeto** com boas práticas de versionamento, garantindo a organização do código. 
- **Documentar as etapas** de transformação e as principais conclusões encontradas.

## Dataset

| Fonte | Nome do Arquivo | Tamanho | Data de Download |
|-------|----------------|--------|----------------|
| [dados.gov.br](https://dados.gov.br/dados/conjuntos-dados/comprasgovbr-contratos) | Contratos do ano corrente | 172.8MB | 2025-09-11 |

> ⚠️ **Atenção**: O dataset contém informações detalhadas sobre contratos firmados por órgãos públicos federais brasileiros, permitindo análise de valores, órgãos contratantes, tipos de contrato, prazos e outros indicadores estratégicos.

## Estrutura do Projeto

O projeto está organizado na seguinte estrutura de pastas para garantir a clareza e a separação de responsabilidades:

```text
contratos-publicos-sql/
├─ docker-compose.yml     # Configuração para subir os containers (PostgreSQL e pgAdmin)
├─ .env                   # Variáveis de ambiente (credenciais do DB, etc.)
├─ .gitignore             # Arquivos ignorados pelo Git
├─ README.md              # Documentação do projeto
├─ datasets/
│  └─ raw/                # Arquivo CSV original baixado da fonte
├─ scripts/
│  ├─ bronze/             # Scripts SQL para a camada Bronze (importação/carga inicial)
│  │   ├─ 01_create_and_load_bronze_contratos_table.sql
│  ├─ silver/             # Scripts SQL para a camada Silver (limpeza e transformação)
│  │   ├─ 01_create_silver_contracts_table.sql
│  │   ├─ 02_create_silver_contracts_errors_table.sql
│  │   ├─ 03_load_silver_contracts_table.sql
│  │   └─ 04_load_silver_contracts_errors_table.sql
│  ├─ gold/               # Scripts SQL para a camada Gold (agregações e visões de negócio)
│  └─ analysis/           # Scripts SQL para consultas e análises ad-hoc```
```

## Tecnologias Utilizadas

- **Banco de Dados**: `PostgreSQL 15.5`
- **Gerenciador de Banco de Dados**: `pgAdmin`
- **Orquestração/Containerização**: `Docker`
- **Linguagem de Consulta**: `SQL`
- **Versionamento**: `Git`

## Como Configurar o Ambiente

Siga estes passos para configurar o projeto:

1.  **Clone o repositório**
    ```bash
    git clone <seu-repo-url>
    cd nome-do-repositorio
    ```
2. **Baixe o Dataset**
    - Acesse a fonte original [Contratos públicos - dados.gov.br](https://dados.gov.br/dados/conjuntos-dados/comprasgovbr-contratos) e baixe o arquivo CSV **Contratos do ano corrente**.
    - Crie a pasta **datasets/raw/** e salve o arquivo baixado nela.
3.  **Configure o Ambiente Docker**
    ```bash
    docker-compose up -d
    ```
    - Certifique-se de ter o **Docker** e o **Docker Compose** instalados.
    - Crie o arquivo **.env** para definir suas credenciais de banco de dados (`POSTGRES_USER`, `POSTGRES_PASSWORD`, `POSTGRES_DB`, `PGADMIN_DEFAULT_EMAIL`, `PGADMIN_DEFAULT_PASSWORD`).
    - Este comando iniciará os containers do **PostgreSQL** e **pgAdmin**.
        - Aguarde alguns instantes para que os serviços iniciem completamente.

## Como Executar

Você pode executar este projeto de duas formas: **via terminal** ou **via pgAdmin**.

### 🔹 Opção 1 — Usando Terminal

1. **Execute os Scripts SQL via Terminal**
    - Você pode executar qualquer script **SQL** dentro do container **PostgreSQL** usando o comando `docker exec`:
    ```bash
    docker exec -i <SERVICE_CONTAINER_NAME> psql -U <POSTGRES_USER> -d <POSTGRES_DB> < ./scripts/<LAYER>/<FILE_NAME>.sql
    ```
    > ⚠️ **Dica**: Substitua **\<SERVICE_CONTAINER_NAME\>**, **\<POSTGRES_USER\>**, **\<POSTGRES_DB\>**, **\<LAYER\>** e **\<FILE_NAME\>** pelos nomes e credenciais do seu ambiente.

2. **Execute os Scripts na Ordem**
- **Bronze**
    - `01_create_and_load_bronze_contracts_table.sql`
- **Silver**
    - `01_create_silver_contracts_table.sql`
    - `02_create_silver_contracts_errors_table.sql`
    - `03_load_silver_contracts_table.sql`
    - `04_load_silver_contracts_errors_table.sql`
- **Gold**
    - scripts da pasta `gold/`
- **Analysis**
    - scripts da pasta `analysis/`

### 🔹 Opção 2 — Usando pgAdmin

1. Acesse o **pgAdmin** em http://localhost:8080.
2. Faça login com as credenciais configuradas no `.env`.
3. Crie uma nova conexão (`Add New Server`) com o banco **PostgreSQL**.
    - **General > Name**: `contratos_db` (ou qualquer outro nome)
    - **Connection > Host name/address**: `database`
    - **Connection > Port**: `5432`
    - **Connection > Username**: `${POSTGRES_USER}`
    - **Connection > Password**: `${POSTGRES_PASSWORD}`
4. Salve e conecte.

> ⚠️ **Observação**: Dentro do **pgAdmin** você deve usar o **nome do serviço do Docker** (`database`) como host, não `localhost`, porque o **pgAdmin** está em outro container.

5. Acesse o banco de dados expandindo a árvore à esquerda no painel do **pgAdmin**.
    - `contratos_db` > `Databases` > `contratos_publicos_db`
6. Clique com o botão direito no banco de dados → **Query Tool**. 
7. No dropdown localizado no topo do **Query Tool** verifique se o **database conectado** é o correto.
8. Copie e cole no **Query Tool**.
   - Abra o arquivo `.sql` no editor do seu computador.
   - Copiei todo o conteúdo e cole na **Query Tool**.
   - Clique em **Execute script (F5)**.

> ⚠️ **Observação 1**: Execute os scripts na mesma ordem descrita em [2. Execute os Scripts na Ordem](#2-execute-os-scripts-na-ordem).

> ⚠️ **Observação 2**: Se preferir, você pode executar os scripts diretamente via terminal, conforme [1. Execute os Scripts SQL via Terminal](#1-execute-os-scripts-sql-via-terminal), em vez de copiar e colar no **Query Tool** do **pgAdmin**.

## Autor

**Vitor Fehelberg**

- [GitHub](https://github.com/vitorfehelberg)
- [LinkedIn](https://www.linkedin.com/in/vitor-fehelberg/)