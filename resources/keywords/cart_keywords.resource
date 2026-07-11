*** Settings ***
Documentation    Ações relacionadas ao fluxo de carrinho de compras.
Library          Browser
Resource         ../pages/cart_page.resource

*** Keywords ***
Adicionar Mochila Ao Carrinho
    Click    ${BTN_ADD_BACKPACK}

Validar Contador Do Carrinho
    [Arguments]    ${quantidade}
    Get Text    ${BADGE_CART}    ==    ${quantidade}

Abrir O Carrinho
    Click    ${BTN_GO_TO_CART}

Validar Produto No Carrinho
    [Arguments]    ${nome_produto}
    Get Text       ${TXT_CART_ITEM_NAME}    ==    ${nome_produto}