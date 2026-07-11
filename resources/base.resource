*** Settings ***
Documentation    Configurações globais e inicialização do sistema sob teste (SauceDemo).
Library          Browser

# para acessar as pastas 'pages' e 'keywords' basta usar o caminho direto
Resource         pages/login_page.resource
Resource         pages/inventory_page.resource
Resource         keywords/login_keywords.resource

*** Variables ***
${BASE_URL}      https://www.saucedemo.com

*** Keywords ***
Start Session
    New Browser    browser=chromium    headless=False
    New Context    viewport={'width': 1280, 'height': 720}
    New Page       ${BASE_URL}

End Session
    Take Screenshot
    Close Browser