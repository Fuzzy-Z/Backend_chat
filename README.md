# Backend Ruby on Rails API

Este é o backend da aplicação, desenvolvido em Ruby on Rails 8.0.2, utilizando Ruby 3.4.4 + PRISM e banco de dados PostgreSQL.

---

## Tecnologias

- Ruby 3.4.4 + PRISM
- Rails 8.0.2
- PostgreSQL v17
- Dependências gerenciadas com Bundler

---

## Pré-requisitos

Antes de rodar o projeto, certifique-se de ter instalado:

- Ruby 3.4.4 com PRISM
- Rails 8.0.2
- PostgreSQL v17 instalado e configurado

---

## Como rodar o projeto

1. **Atualizar pacotes do sistema**

```bash
sudo apt update
```

2. **Instalar dependências do PostgreSQL**

```bash
sudo apt install -y libpq-dev postgresql postgresql-contrib
```

3. **Configurar banco de dados**

- Instale o PostgreSQL v17
- Altere o arquivo `config/database.yml` para inserir seu usuário e senha do PostgreSQL.

4. **Instalar gems do projeto**

```bash
bundle install
```

5. **Criar o banco de dados**

```bash
rails db:create
```

6. **Rodar as migrações**

```bash
rails db:migrate
```

7. **Iniciar o servidor Rails**

```bash
rails s
```

O backend estará rodando por padrão em [http://localhost:3000](http://localhost:3000).

---

## Considerações

- Caso utilize outro usuário ou senha no PostgreSQL, lembre-se de alterar corretamente no arquivo `config/database.yml`.
- Recomendamos usar um gerenciador de versões do Ruby (como `rbenv` ou `rvm`) para garantir que a versão correta do Ruby esteja ativa.
- O projeto está preparado para rodar em ambiente Linux Ubuntu (ou similar).

---

## Contato

Dúvidas, sugestões ou contribuições? Abra uma issue ou entre em contato.

---
