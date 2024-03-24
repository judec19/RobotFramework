*** Settings ***
Documentation    Essa suíte reforça o estudo sobre o uso de variáveis como argumentos de Keywords
Library    String

*** Variables ***
&{PESSOA}    nome=Joao    sobrenome=Souza
${DOMINIO-EMAIL}    @testerobot.com
&{PESSOA_2}    nome=Joao    cpf=12312312399

*** Test Cases ***

Gerar um e-mail customizado
    Receber os dados do usuário e uma palavra aleatória

Gerar um user ID com as primeiras duas letras do nome da pessoa e os 6 últimos dígitos do CPF
    [Tags]    userid
    Receber o nome da pessoa e o CPF

*** Keywords ***

Receber os dados do usuário e uma palavra aleatória
    Adicionando os dados a uma nova keyword    ${PESSOA.nome}    ${PESSOA.sobrenome}

Adicionando os dados a uma nova keyword
    [Arguments]    ${NOME_USUARIO}    ${SOBRENOME_USUARIO}
    ${PALAVRA_ALEATORIA}    Generate Random String
    ${EMAIL}    Catenate    ${NOME_USUARIO}${SOBRENOME_USUARIO}${PALAVRA_ALEATORIA}${DOMINIO-EMAIL}
    Log    ${EMAIL}

Receber o nome da pessoa e o CPF
    Dados recebidos, gerar um user ID com o nome e o CPF    ${PESSOA_2.nome}    ${PESSOA_2.cpf}

Dados recebidos, gerar um user ID com o nome e o CPF
    [Arguments]    ${NOME}    ${CPF}
    ${NOME_ID}    Convert To Lower Case    ${NOME}
    ${NOME_ID}    Get Substring    ${NOME_ID}    0    2
    ${CPF_ID}    Get Substring    ${CPF}    -6
    ${USER_ID}    Set Variable    ${NOME_ID}${CPF_ID}
    Log    ${USER_ID}