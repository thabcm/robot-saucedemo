*** Settings ***
Documentation    Mapeamento dos elementos da página de Login do SauceDemo.

*** Variables ***
# Seletores da tela de login utilizando os atributos de teste do site
${INPUT_USERNAME}    css=input[data-test="username"]
${INPUT_PASSWORD}    css=input[data-test="password"]
${BTN_LOGIN}         css=input[data-test="login-button"]
${TXT_ERROR_CONTAINER}    css=h3[data-test="error"]