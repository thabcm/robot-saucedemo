*** Settings ***
Documentation    Ações e palavras-chave da tela de Login.
Library          Browser
Resource         ../pages/login_page.resource

*** Keywords ***
Preencher Usuário
    [Arguments]    ${username}
    Fill Text      ${INPUT_USERNAME}    ${username}

Preencher Senha
    [Arguments]    ${password}
    Fill Text      ${INPUT_PASSWORD}    ${password}

Submeter Login
    Click          ${BTN_LOGIN}

Login Com Credenciais
    [Arguments]    ${username}    ${password}
    Preencher Usuário    ${username}
    Preencher Senha      ${password}
    Submeter Login

Validar Mensagem de Erro
    [Arguments]    ${expected_error}
    # Espera o elemento de erro ficar visível e valida o texto dele de uma vez só
    Get Text    ${TXT_ERROR_CONTAINER}    ==    ${expected_error}