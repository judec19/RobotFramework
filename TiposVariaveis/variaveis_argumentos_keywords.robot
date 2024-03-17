*** Settings ***
Documentation    Essa suíte reforça o estudo sobre o uso de variáveis como argumentos de Keywords
Library    String

*** Variables ***
&{PESSOA}    nome=Joao    sobrenome=Souza
${DOMINIO-EMAIL}    @testerobot.com

*** Test Cases ***

Gerar um e-mail customizado
    Receber os dados do usuário e uma palavra aleatória

*** Keywords ***

Receber os dados do usuário e uma palavra aleatória
    Adicionando os dados a uma nova keyword    ${PESSOA.nome}    ${PESSOA.sobrenome}

Adicionando os dados a uma nova keyword
    [Arguments]    ${NOME_USUARIO}    ${SOBRENOME_USUARIO}
    ${PALAVRA_ALEATORIA}    Generate Random String
    ${EMAIL}    Catenate    ${NOME_USUARIO}${SOBRENOME_USUARIO}${PALAVRA_ALEATORIA}${DOMINIO-EMAIL}
    Log    ${EMAIL}