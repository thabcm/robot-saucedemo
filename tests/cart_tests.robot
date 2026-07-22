*** Settings ***
Documentation        Suíte de testes do carrinho de compras do SauceDemo.
Resource             ../resources/base.resource

Test Setup           Start Session
Test Teardown        End Session

*** Test Cases ***
Deve adicionar um produto ao carrinho com sucesso
    [Tags]    regression    cart
    Dado que o usuário está logado no sistema
    Quando ele adiciona o produto "Sauce Labs Backpack" ao carrinho
    Então o ícone do carrinho deve exibir "1" item
    E ao abrir o carrinho o produto deve estar listado

Deve remover um produto do carrinho com sucesso
    [Tags]    regression    cart
    Dado que o usuário tem o produto "Sauce Labs Backpack" no carrinho
    E está na página do carrinho
    Quando ele remove o produto "Sauce Labs Backpack"
    Então o carrinho deve ficar vazio

*** Keywords ***
Dado que o usuário está logado no sistema
    Login Com Credenciais    standard_user    secret_sauce
    Wait For Elements State  ${SPAN_TITLE}    visible    timeout=5s

Quando ele adiciona o produto "${nome_produto}" ao carrinho
    Adicionar Mochila Ao Carrinho

Então o ícone do carrinho deve exibir "${quantidade}" item
    Validar Contador Do Carrinho    ${quantidade}

E ao abrir o carrinho o produto deve estar listado
    Abrir O Carrinho
    Validar Produto No Carrinho    Sauce Labs Backpack

Dado que o usuário tem o produto "${nome_produto}" no carrinho
    Dado que o usuário está logado no sistema
    Adicionar Mochila Ao Carrinho

E está na página do carrinho
    Abrir O Carrinho

Quando ele remove o produto "${nome_produto}"
    Remover Mochila Do Carrinho

Então o carrinho deve ficar vazio
    Validar Carrinho Vazio