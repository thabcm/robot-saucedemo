*** Settings ***
Documentation    Configurações globais e inicialização do sistema sob teste (SauceDemo).
Library          Browser

# para acessar as pastas 'pages' e 'keywords' basta usar o caminho direto
Resource         pages/login_page.resource
Resource         pages/inventory_page.resource
Resource         keywords/login_keywords.resource
Resource         pages/cart_page.resource
Resource         keywords/cart_keywords.resource
Resource         pages/checkout_page.resource
Resource         keywords/checkout_keywords.resource

*** Variables ***
${BASE_URL}      https://www.saucedemo.com

*** Keywords ***
Start Session
    [Arguments]    ${HEADLESS}=${TRUE}
    ${HEADLESS_BOOL}=    Convert To Boolean    ${HEADLESS}
    New Browser    browser=chromium    headless=${HEADLESS_BOOL}
    New Context    viewport={'width': 1280, 'height': 720}
    New Page       ${BASE_URL}

End Session
    Run Keyword And Ignore Error    Take Screenshot