# Automação de Testes Web com Robot Framework & Browser Library

Este projeto apresenta uma suíte de testes automatizados utilizando o Sauce Demo.

O projeto utiliza o Robot Framework junto com a Browser Library, implementando o padrão de arquitetura Page Objects com escrita de cenários em BDD (Gherkin).

## Tecnologias Utilizadas
*   **Python 3.12**
*   **Robot Framework 7.0**
*   **Robot Framework Browser Library**

---

### O que já foi desenvolvido:
* **Arquitetura Base:**
* **Suíte de Login (Autenticação):**
    *   Caminho feliz com usuário válido.
    *   Tratamento de erro com senha incorreta.
    *   Tratamento de erro com usuário bloqueado.
* **Suíte de Carrinho de Compras:**
    *   Fluxo E2E de adicionar produto ao carrinho.
    *   Validação dinâmica do contador de itens (badge) do carrinho.
    *   Validação de presença do item na página de listagem do carrinho.

---

### Backlog:
* **Fluxo de Remoção do Carrinho:** Validar a exclusão de itens e conferir se o contador decrementa corretamente.
* **Fluxo de Checkout Completo:** Automatizar o fluxo de preenchimento de dados do cliente, página de sumário de compra e validação da tela de sucesso.
* **Testes Baseados em Dados (Data-Driven Testing):** Criar cenários que testam múltiplos usuários inválidos usando uma única Keyword estruturada com massa de dados.
*  **Configuração Headless Dinâmica:** Alterar a Start Session para aceitar um argumento que permita rodar os testes sem abrir a interface gráfica.
*  **Integração Contínua:** Criar uma pipeline no GitHub Actions para executar os testes automaticamente.
* **Testes de API com RequestsLibrary:** Criar uma suíte de testes de integração consumindo uma API REST para validar verbos HTTP, status codes e payloads JSON.
* **Geração de Relatórios Visuais Avançados:** Integrar a biblioteca robotframework-metrics para transformar o log padrão em um dashboard HTML moderno.