*** Settings ***
Documentation        Suíte de testes do fluxo de checkout do SauceDemo.
Resource             ../resources/base.resource

Test Setup           Start Session
Test Teardown        End Session

*** Test Cases ***
Deve realizar o checkout de um produto com sucesso
    [Tags]    regression    checkout    e2e
    Dado que o usuário tem um produto no carrinho
    E avança para a tela de checkout
    Quando ele preenche os dados do cliente
    E finaliza o pedido
    Então deve ver a mensagem de confirmação de compra

Deve validar campos obrigatórios no formulário de checkout
    [Documentation]    Valida as mensagens de erro ao tentar avançar com dados incompletos usando DDT.
    [Tags]             regression    checkout    ddt
    [Template]         Validar Erro Ao Submeter FormIncompleto

    # FIRST_NAME    LAST_NAME    POSTAL_CODE    MENSAGEM DE ERRO ESPERADA
    ${EMPTY}        Melo         50000-000      Error: First Name is required
    Thalita         ${EMPTY}     50000-000      Error: Last Name is required
    Thalita         Melo         ${EMPTY}       Error: Postal Code is required


*** Keywords ***
Dado que o usuário tem um produto no carrinho
    Login Com Credenciais    standard_user    secret_sauce
    Wait For Elements State  ${SPAN_TITLE}    visible    timeout=5s
    Adicionar Mochila Ao Carrinho
    Abrir O Carrinho

E avança para a tela de checkout
    Iniciar Checkout

Quando ele preenche os dados do cliente
    Preencher Informações Do Cliente    Thalita    Melo    50000-000

E finaliza o pedido
    Finalizar Compra

Então deve ver a mensagem de confirmação de compra
    Validar Compra Com Sucesso

Validar Erro Ao Submeter FormIncompleto
    [Arguments]    ${first_name}    ${last_name}    ${postal_code}    ${mensagem_erro_esperada}
    # Cria um contexto zerado (limpa cookies e localStorage do navegador)
    New Context    viewport={'width': 1280, 'height': 720}
    New Page       ${BASE_URL}
    Dado que o usuário tem um produto no carrinho
    E avança para a tela de checkout
    Tentar Submeter Checkout Sem Dados    ${first_name}    ${last_name}    ${postal_code}
    Validar Mensagem De Erro Do Checkout   ${mensagem_erro_esperada}