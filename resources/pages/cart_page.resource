*** Settings ***
Documentation    Mapeamento dos elementos do carrinho e inventário de produtos.

*** Variables ***
# Botão para adicionar o primeiro produto (Sauce Labs Backpack)
${BTN_ADD_BACKPACK}       css=button[data-test="add-to-cart-sauce-labs-backpack"]

# Ícone do carrinho com o contador de itens
${BADGE_CART}             css=span[data-test="shopping-cart-badge"]
${BTN_GO_TO_CART}         css=a[data-test="shopping-cart-link"]

# Elementos de validação dentro da página do carrinho
${TXT_CART_ITEM_NAME}     css=div[data-test="inventory-item-name"]

# Botão para remover a mochila do carrinho
${BTN_REMOVE_BACKPACK}    css=button[data-test="remove-sauce-labs-backpack"]

# Elemento do badge do carrinho quando zerado/invisível
${BADGE_CART_COUNT}       css=span[data-test="shopping-cart-badge"]