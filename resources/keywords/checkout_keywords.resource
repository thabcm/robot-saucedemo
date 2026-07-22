*** Settings ***
Documentation    Ações relacionadas ao fluxo de checkout e finalização de compra.
Library          Browser
Resource         ../pages/checkout_page.resource

*** Keywords ***
Iniciar Checkout
    Click    ${BTN_CHECKOUT}

Preencher Informações Do Cliente
    [Arguments]    ${first_name}    ${last_name}    ${postal_code}
    Fill Text      ${INPUT_FIRST_NAME}     ${first_name}
    Fill Text      ${INPUT_LAST_NAME}      ${last_name}
    Fill Text      ${INPUT_POSTAL_CODE}    ${postal_code}
    Click          ${BTN_CONTINUE}

Finalizar Compra
    Click    ${BTN_FINISH}

Validar Compra Com Sucesso
    Get Text    ${TXT_COMPLETE_HEADER}    ==    ${TEXT_SUCCESS_MESSAGE}