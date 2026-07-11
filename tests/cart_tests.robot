*** Settings ***
Documentation        Suíte de testes do carrinho de compras do SauceDemo.
Resource             ../resources/base.resource
Resource             ../resources/keywords/cart_keywords.resource

Test Setup           Start Session
Test Teardown        End Session

*** Test Cases ***
Deve adicionar um produto ao carrinho com sucesso
    [Tags]    regression    cart
    Dado que o usuário está logado no sistema
    Quando ele adiciona o produto "Sauce Labs Backpack" ao carrinho
    Então o ícone do carrinho deve exibir "1" item
    E ao abrir o carrinho o produto deve estar listado

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