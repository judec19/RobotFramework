*** Settings ***
Library    SeleniumLibrary
Library    Screenshot

*** Variables ***
${URL}    http://www.amazon.com.br
${MENU_ELETRONICOS}    //a[@href='/Eletronicos-e-Tecnologia/b/?ie=UTF8&node=16209062011&ref_=nav_cs_electronics'][contains(.,'Eletrônicos')]
${HEADER_ELETRONICOS}    //h1[contains(.,'Eletrônicos e Tecnologia')]
${TEXTO_HEADER_ELETRONICOS}    Eletrônicos e Tecnologia
${CAIXA_PESQUISA}    twotabsearchtextbox
${BOTAO_PESQUISA}    nav-search-submit-button
${BOTAO_ADD_CARRINHO}    add-to-cart-button
${PRIMEIRO_PRODUTO_LISTA}    //img[@data-image-index='1']
${BOTAO_CARRINHO}    nav-cart

*** Keywords ***
Abrir o navegador
    Open Browser    url=http://amazon.com.br    browser=chrome    options=add_experimental_option("detach", True)
    Maximize Browser Window

Fechar o navegador
    Capture Page Screenshot
    Close Browser 

Acessar a home page do site Amazon.com.br
    Go To    url=${URL}
    Wait Until Element Is Visible    locator=${MENU_ELETRONICOS}

Entrar no menu "Eletrônicos"
    Click Element    locator=${MENU_ELETRONICOS}

Verificar se aparece a frase "Eletrônicos e Tecnologia"
    Wait Until Page Contains    text=${TEXTO_HEADER_ELETRONICOS}
    Wait Until Element Is Visible    locator=${HEADER_ELETRONICOS}

Verificar se o título da página fica "${TITULO}"
    Title Should Be    title=${TITULO}

Verificar se aparece a categoria "${NOME_CATEGORIA}"
    Element Should Be Visible    locator=//a[@aria-label='${NOME_CATEGORIA}']

Digitar o nome de produto "${NOME_PRODUTO}" no campo de pesquisa
    Input Text    locator=${CAIXA_PESQUISA}    text=${NOME_PRODUTO}

Clicar no botão de pesquisa
    Click Element    locator=${BOTAO_PESQUISA}

Verificar o resultado da pesquisa, se está listando o produto ${NOME_PRODUTO}
    Wait Until Element Is Visible    locator=(//span[contains(.,'${NOME_PRODUTO}')])[3]

Selecionar o primeiro produto da lista e clicar nele para abrir sua respectiva página
    Click Element    locator=${PRIMEIRO_PRODUTO_LISTA}
    Capture Page Screenshot

Adicionar o produto "${NOME_PRODUTO}" no carrinho
    Click Button    locator=${BOTAO_ADD_CARRINHO}

Verificar se o produto "${NOME_PRODUTO}" foi adicionado com sucesso
    Click Element    locator=${BOTAO_CARRINHO}
    Wait Until Element Is Visible    locator=//span[@class='a-truncate-cut'][contains(.,'Console Xbox Series S')]

Remover o produto "Console Xbox Series S" do carrinho
    Click Element    locator=//input[contains(@value,'Excluir')]

Verificar se o carrinho fica vazio
    Wait Until Element Is Visible    locator=//h1[contains(.,'Seu carrinho de compras da Amazon está vazio.')]

# GHERKIN STEPS

Dado que estou na home page da Amazon.com.br
    Acessar a home page do site Amazon.com.br
    Verificar se o título da página fica "Amazon.com.br | Tudo pra você, de A a Z."

Quando acessar o menu "Eletrônicos"
    Entrar no menu "Eletrônicos"

Então o título da página deve ficar "Eletrônicos e Tecnologia | Amazon.com.br"
    Verificar se o título da página fica "Eletrônicos e Tecnologia | Amazon.com.br"

E o texto "Eletrônicos e Tecnologia" deve ser exibido na página
    Verificar se aparece a frase "Eletrônicos e Tecnologia"

E a categoria "Computadores e Informática" deve ser exibida na página
    Verificar se aparece a categoria "Computadores e Informática"

Quando pesquisar pelo produto "Xbox Series S"
    Digitar o nome de produto "Xbox Series S" no campo de pesquisa
    Clicar no botão de pesquisa

Então o título da página deve ficar "Amazon.com.br : Xbox Series S"
    Verificar se o título da página fica "Amazon.com.br : Xbox Series S"

E um produto da linha "Xbox Series S" deve ser mostrado na página
    Verificar o resultado da pesquisa, se está listando o produto "Xbox Series S"

Quando adicionar o produto "Xbox Series S" no carrinho
    Digitar o nome de produto "Xbox Series S" no campo de pesquisa
    Clicar no botão de pesquisa
    Verificar o resultado da pesquisa, se está listando o produto "Xbox Series S"
    Selecionar o primeiro produto da lista e clicar nele para abrir sua respectiva página
    Adicionar o produto "Xbox Series S" no carrinho

Então o produto "Xbox Series S" deve ser mostrado no carrinho
    Verificar se o produto "Console Xbox Series S" foi adicionado com sucesso

E existe o produto "Xbox Series S" no carrinho
    Digitar o nome de produto "Xbox Series S" no campo de pesquisa
    Clicar no botão de pesquisa
    Verificar o resultado da pesquisa, se está listando o produto "Xbox Series S"
    Selecionar o primeiro produto da lista e clicar nele para abrir sua respectiva página
    Adicionar o produto "Xbox Series S" no carrinho
    Verificar se o produto "Console Xbox Series S" foi adicionado com sucesso

Quando remover o produto "Xbox Series S" do carrinho
    Remover o produto "Console Xbox Series S" do carrinho

Então o carrinho deve ficar vazio
    Verificar se o carrinho fica vazio