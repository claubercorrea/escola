# 🏫 Sistema de Banco de Dados Escolar

![MySQL](https://img.shields.io/badge/MySQL-005C84?style=for-the-badge&logo=mysql&logoColor=white)
![MySQL Workbench](https://img.shields.io/badge/MySQL%20Workbench-4479A1?style=for-the-badge&logo=mysql&logoColor=white)
![Database Design](https://img.shields.io/badge/Modelagem-DER%20%2F%20MER-orange?style=for-the-badge)
![Status](https://img.shields.io/badge/Status-Concluído-brightgreen?style=for-the-badge)

Repositório dedicado ao projeto de **Modelagem Conceitual e Lógica de Banco de Dados Relacional** para gerenciamento escolar. O projeto abrange a representação de entidades acadêmicas fundamentais como **Alunos**, **Professores**, **Turmas** e **Disciplinas**, bem como seus relacionamentos e regras de negócio.

---

## 📌 Conteúdo do Repositório

- **[Conceptual model  escola.pdf](./Conceptual%20model%20%20escola.pdf)**: Diagrama Entidade-Relacionamento (DER / Modelo Conceitual) desenvolvido no [brModelo Web](https://app.brmodeloweb.com/).
- **[escola.mwb](./escola.mwb)**: Modelo Físico/Lógico original editável no **MySQL Workbench**.
- **[escola.pdf](./escola.pdf)**: Visualização gráfica exportada do diagrama relacional do MySQL Workbench.
- **[escola.sql](./escola.sql)**: Script SQL DDL de criação do banco de dados e suas respectivas tabelas, chaves primárias e estrangeiras.

---

## 📐 Modelagem de Dados

### 1. Modelo Conceitual (DER)
Representa a visão de alto nível do sistema escolar, destacando as entidades do domínio, seus atributos e as cardinalidades de associação.

```mermaid
erDiagram
    ALUNO {
        int matricula_aluno PK
        string nome_completo_aluno
        int idade
        string email
    }
    PROFESSOR {
        int id_professor PK
        string nome_completo_prof
        string disciplina
    }
    TURMA {
        int id_turma PK
        string nome_turma
    }
    DISCIPLINA {
        int id_disciplina PK
        string nome_disciplina
    }

    ALUNO ||--o{ PROFESSOR : "possui"
    ALUNO }o--o{ DISCIPLINA : "cursa"
    PROFESSOR }o--|{ TURMA : "leciona"
    DISCIPLINA }o--|{ TURMA : "pertence"
```

### 2. Modelo Lógico / Relacional (MER)
Estrutura normalizada com os tipos de dados primitivos (`INT`, `VARCHAR`), restrições de integridade (`PRIMARY KEY`, `FOREIGN KEY`):

```mermaid
classDiagram
    class alunos {
        +INT idalunos PK
        +VARCHAR(45) nome_aluno
        +INT idade
        +VARCHAR(45) email
    }

    class disciplina {
        +INT id_disciplina PK
        +VARCHAR(45) nome_disciplina
    }

    class turma {
        +INT idturma PK
        +VARCHAR(45) nome_turma
        +INT disciplina_id_disciplina FK
    }

    class professor {
        +INT idprofessor PK
        +VARCHAR(45) nome_professor
        +VARCHAR(45) disciplina
        +INT alunos_idalunos FK
        +INT turma_idturma FK
        +INT turma_disciplina_id_disciplina FK
    }

    disciplina "1" --> "N" turma : fk_turma_disciplina1
    alunos "1" --> "N" professor : fk_professor_alunos1
    turma "1" --> "N" professor : fk_professor_turma1
```

---

## 🗄️ Dicionário de Dados

### Tabela: `alunos`
Armazena as informações cadastrais dos discentes matriculados.

| Campo | Tipo | Nulo | Chave | Descrição |
| :--- | :--- | :---: | :---: | :--- |
| `idalunos` | `INT` | ❌ | PK | Identificador único do aluno |
| `nome_aluno` | `VARCHAR(45)` | ✔️ | - | Nome completo do aluno |
| `idade` | `INT` | ✔️ | - | Idade do aluno |
| `email` | `VARCHAR(45)` | ✔️ | - | Endereço de e-mail de contato |

---

### Tabela: `disciplina`
Armazena o catálogo de matérias/disciplinas oferecidas pela instituição.

| Campo | Tipo | Nulo | Chave | Descrição |
| :--- | :--- | :---: | :---: | :--- |
| `id_disciplina` | `INT` | ❌ | PK | Identificador único da disciplina |
| `nome_disciplina` | `VARCHAR(45)` | ✔️ | - | Nome da matéria/disciplina |

---

### Tabela: `turma`
Organização dos alunos e disciplinas em turmas específicas.

| Campo | Tipo | Nulo | Chave | Descrição |
| :--- | :--- | :---: | :---: | :--- |
| `idturma` | `INT` | ❌ | PK | Identificador da turma |
| `nome_turma` | `VARCHAR(45)` | ✔️ | - | Código/nome de identificação da turma |
| `disciplina_id_disciplina` | `INT` | ❌ | FK | Chave estrangeira referenciando a `disciplina` |

---

### Tabela: `professor`
Armazena os docentes e suas vinculações pedagógicas com turmas e alunos.

| Campo | Tipo | Nulo | Chave | Descrição |
| :--- | :--- | :---: | :---: | :--- |
| `idprofessor` | `INT` | ❌ | PK | Identificador único do professor |
| `nome_professor` | `VARCHAR(45)` | ✔️ | - | Nome completo do professor |
| `disciplina` | `VARCHAR(45)` | ✔️ | - | Área de especialização do docente |
| `alunos_idalunos` | `INT` | ❌ | FK | Referência ao aluno |
| `turma_idturma` | `INT` | ❌ | FK | Referência à turma |
| `turma_disciplina_id_disciplina`| `INT` | ❌ | FK | Referência composta à disciplina vinculada à turma |

---

## 🚀 Como Utilizar este Projeto

### Abrir o modelo no MySQL Workbench
1. Certifique-se de ter o [MySQL Workbench](https://dev.mysql.com/downloads/workbench/) instalado.
2. Abra o programa e clique em **File > Open Model**.
3. Selecione o arquivo [`escola.mwb`](./escola.mwb) presente na raiz deste repositório.

### Executar o script SQL no seu Banco de Dados
Você pode executar diretamente via terminal ou através de qualquer cliente SQL (DBeaver, MySQL Workbench, phpMyAdmin):

```bash
# Via terminal MySQL
mysql -u seu_usuario -p < escola.sql
```

---

## 🛠️ Tecnologias Utilizadas

- **[brModelo Web](https://app.brmodeloweb.com/)**: Criação do diagrama conceitual (DER).
- **[MySQL Workbench](https://www.mysql.com/products/workbench/)**: Modelagem relacional visual e geração dos arquivos `.mwb`.
- **MySQL / SQL (DDL)**: Criação das tabelas e definição de constraints relacionais.
- **Git & GitHub**: Versionamento de código e documentação.

---

## 👤 Autor

Desenvolvido por **[Clauber Correa](https://github.com/claubercorrea)**.
