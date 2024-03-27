*** Settings ***
Library    RequestsLibrary
Library    Collections
Library    String

*** Variables ***


*** Keywords ***
Criar um novo usuário
    ${palavra_aleatoria}    Generate Random String    length=5    chars=[LOWER]
    Set Test Variable    ${EMAIL_USUARIO}    ${palavra_aleatoria}@emailteste.com.br

Criar a sessão com o ServeRest
    ${headers}    Create Dictionary    accept=application/json    Content-Type=application/json
    Create Session
    ...    alias=ServeRestSession
    ...    url=https://serverest.dev
    ...    headers=${headers}

Cadastrar o usuário criado
    [Arguments]    ${email}    ${status_code}
    ${body}    Create Dictionary
    ...    nome=Joao Antonio de Souza
    ...    email=${email}
    ...    password=12345
    ...    administrador=true

    Criar a sessão com o ServeRest

    ${resposta_post}    POST On Session
    ...    alias=ServeRestSession
    ...    url=/usuarios
    ...    json=${body}
    ...    expected_status=${status_code}

    Set Test Variable    ${RESPOSTA_post}    ${resposta_post.json()}
    Set Test Variable    ${ID_USUARIO}    ${resposta_post["_id"]}

Verificar se o usuário foi cadastrado com sucesso
    Dictionary Should Contain Item    ${RESPOSTA_post}    message    Cadastro realizado com sucesso
    Dictionary Should Contain Key    ${RESPOSTA_post}     _id

Consultar os dados do novo usuário
    [Arguments]    ${status_code}
    ${resposta_get}    GET On Session
    ...    alias=ServeRestSession
    ...    expected_status=${status_code}
    ...    url=/usuarios/${ID_USUARIO}
    
    Set Test Variable    ${RESPOSTA_GET}    ${resposta_get.json()}
    Get Dictionary Items    ${RESPOSTA_GET}

Conferir os dados retornados
    [Arguments]    ${email}
    Dictionary Should Contain Item    ${RESPOSTA_GET}    nome             Joao Antonio de Souza
    Dictionary Should Contain Item    ${RESPOSTA_GET}    email            ${email}
    Dictionary Should Contain Item    ${RESPOSTA_GET}    password         12345
    Dictionary Should Contain Item    ${RESPOSTA_GET}    administrador    true
    Dictionary Should Contain Item    ${RESPOSTA_GET}    _id              ${ID_USUARIO}