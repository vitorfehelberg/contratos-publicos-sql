# Projeto SQL - Contratos Públicos Federais

## Sobre o Projeto
Este projeto visa aplicar e aprimorar conhecimentos em SQL utilizando dados públicos do governo federal brasileiro, fornecidos pelo portal [dados.gov.br](https://dados.gov.br).

O foco principal é explorar, transformar e analisar contratos públicos federais utilizando **SQL como ferramenta central**, aplicando **modelagem de dados, consultas analíticas e boas práticas de versionamento**.

## Principais Objetivos

- **Criar uma pipeline de dados em camadas**:
    - **Bronze**: Dados brutos, importados diretamente do CSV original, para garantir a rastreabilidade.
    - **Silver**: Dados limpos, padronizados e transformados, prontos para análise.
    - **Gold**: Dados agregados, prontos para o consumo e otimizados para consultas analíticas e dashboards.
- **Desenvolver consultas SQL** que gerem insights sobre os gastos públicos.
- **Estruturar o projeto** com boas práticas de versionamento, garantindo a organização do código. 
- **Documentar as etapas** de transformação e as principais conclusões encontradas.

## Dataset

- **Fonte**: [Contratos públicos - dados.gov.br](https://dados.gov.br/dados/conjuntos-dados/comprasgovbr-contratos).
- **Nome do Arquivo**: Contratos do ano corrente
- **Tamanho**: 172.8MB
- **Data de download**: 2025-08-08

> O dataset contém informações detalhadas sobre contratos firmados por órgãos públicos federais brasileiros, permitindo a análise de valores, órgãos contratantes, tipos de contrato, prazos e outros indicadores estratégicos.

## Estrutura do Projeto

O projeto está organizado na seguinte estrutura de pastas para garantir a clareza e a separação de responsabilidades:

```text
contratos-publicos-sql/
├─ docker-compose.yml     # Configuração para subir os containers (Postgres e pgAdmin)
├─ .env                   # Variáveis de ambiente (credenciais do DB, etc.)
├─ .gitignore             # Arquivos ignorados pelo Git
├─ README.md              # Documentação do projeto
├─ datasets/
│  └─ raw/                # Arquivo CSV original baixado da fonte
├─ initdb/                # Scripts de inicialização do banco de dados
├─ pgdata/                # Diretório para o armazenamento persistente dos dados do PostgreSQL
├─ scripts/
│  ├─ bronze/             # Scripts SQL para a camada Bronze (importação/carga inicial)
│  ├─ silver/             # Scripts SQL para a camada Silver (limpeza e transformação)
│  ├─ gold/               # Scripts SQL para a camada Gold (agregações e visões de negócio)
│  └─ analysis/           # Scripts SQL para consultas e análises ad-hoc```
```

## Tecnologias Utilizadas

- **Banco de Dados**: PostgreSQL
- **Gerenciador de Banco de Dados**: pgAdmin
- **Orquestração/Containerização**: Docker
- **Linguagem de Consulta**: SQL
- **Versionamento**: Git

## Como Executar

Siga estes passos para configurar e rodar o projeto localmente e replicar a análise:

1.  **Clone o repositório**:
    ```bash
    git clone <seu-repo-url>
    cd nome-do-repositorio
    ```
2. **Baixe o Dataset**:
    - Acesse a fonte original [Contratos públicos - dados.gov.br](https://dados.gov.br/dados/conjuntos-dados/comprasgovbr-contratos) e baixe o arquivo CSV **Contratos do ano corrente**. Salve-o na pasta **dataset/raw/** do projeto.
3.  **Configure o Ambiente Docker**:
    Certifique-se de ter o **Docker** e o **Docker Compose** instalados em sua máquina.
    - Edite o arquivo **.env** para definir suas credenciais de banco de dados (ex.: POSTGRES_USER, POSTGRES_PASSWORD).
    - Iniciei os containers do PostgreSQL e pgAdmin:
    ```bash
    docker-compose up -d
    ```
    - Aguarde alguns instantes para que os serviços iniciem completamente.
    - A flag **-d** executa os containers em segundo plano (**detached note**).
    
4.  **Carregue os Dados na Camada Bronze**:
    - Conecte-se ao PostgreSQL via pgAdmin (geralmente **http://localhost:8080** ou uma porta similar, usando as credenciais definidas no **.env**).
    - Execute os scripts SQL presentes na pasta **scripts/bronze/** que contêm os comandos (**COPY** ou **INSERT**) para importar o CSV da pasta **datasets/raw/** para uma tabela de staging ou diretamente na camada Bronze.
5.  **Execute as Transformações e Análises**:
    - Execute os scripts SQL da pasta **scripts/silver/** para limpar e transformar os dados, gerando as tabelas ou visões da camada Silver.
    - Em seguida, execute os scripts da pasta **scripts/gold/** para criar as agregações e visões otimizadas para consulta.
    - Utilize os scripts da pasta **/scripts/analysis/** para realizar suas consultas de negócio e extrair insights.
    
## Autor

**Vitor Fehelberg**

- [GitHub](https://github.com/vitorfehelberg)
- [LinkedIn](https://www.linkedin.com/in/vitor-fehelberg-851156101/)