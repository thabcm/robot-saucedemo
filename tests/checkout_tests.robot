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