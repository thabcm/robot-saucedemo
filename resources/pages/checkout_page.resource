*** Settings ***
Documentation    Mapeamento dos elementos das telas de Checkout (Passo 1, Passo 2 e Confirmação).

*** Variables ***
# Botão do carrinho para ir pro Checkout
${BTN_CHECKOUT}             css=button[data-test="checkout"]

# Formulário (Passo 1)
${INPUT_FIRST_NAME}         css=input[data-test="firstName"]
${INPUT_LAST_NAME}          css=input[data-test="lastName"]
${INPUT_POSTAL_CODE}        css=input[data-test="postalCode"]
${BTN_CONTINUE}             css=input[data-test="continue"]

# Sumário de Compra (Passo 2)
${BTN_FINISH}               css=button[data-test="finish"]

# Tela Final de Sucesso (Complete)
${TXT_COMPLETE_HEADER}      css=h2[data-test="complete-header"]
${TEXT_SUCCESS_MESSAGE}     Thank you for your order!