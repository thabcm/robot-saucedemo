*** Settings ***
Documentation        Suíte de testes de autenticação do SauceDemo.
Resource             ../resources/base.resource

Test Setup           Start Session
Test Teardown        End Session

*** Test Cases ***
Deve realizar login com sucesso
    [Tags]    smoke    login
    Dado que o usuário está na página de login
    Quando ele insere credenciais válidas
    Então deve ser redirecionado para a página de produtos

Deve exibir erro com senha incorreta
    [Tags]    regression    login_error
    Dado que o usuário está na página de login
    Quando ele tenta logar com a senha incorreta
    Então deve ver a mensagem    Epic sadface: Username and password do not match any user in this service

Deve exibir erro com usuário bloqueado
    [Tags]    regression    login_error
    Dado que o usuário está na página de login
    Quando ele tenta logar com um usuário bloqueado
    Então deve ver a mensagem    Epic sadface: Sorry, this user has been locked out.

*** Keywords ***
Dado que o usuário está na página de login
    # Garante que a página carregou esperando pelo botão de login ficar visível
    Wait For Elements State    ${BTN_LOGIN}    visible    timeout=5s

Quando ele insere credenciais válidas
    Login Com Credenciais    standard_user    secret_sauce

Então deve ser redirecionado para a página de produtos
    # Valida se o texto do elemento na página de produtos é exatamente "Products"
    Get Text    ${SPAN_TITLE}    ==    ${TEXT_PRODUCT_TITLE}

Quando ele tenta logar com a senha incorreta
    Login Com Credenciais    standard_user    senha_errada

Quando ele tenta logar com um usuário bloqueado
    Login Com Credenciais    locked_out_user    secret_sauce

Então deve ver a mensagem
    [Arguments]    ${mensagem_esperada}
    Validar Mensagem de Erro    ${mensagem_esperada}