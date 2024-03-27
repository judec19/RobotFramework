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

    IF    ${resposta_post.status_code} == 201
        Set Test Variable    ${ID_USUARIO}    ${resposta_post.json()["_id"]}
    END

    Set Test Variable    ${RESPOSTA_post}    ${resposta_post.json()}

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

Repetir cadastro
    Cadastrar o usuário criado    email=${EMAIL_USUARIO}    status_code=400

Verificar se o sistema bloqueia a criação de um usuário já cadastrado
    Dictionary Should Contain Item    ${RESPOSTA_post}    message    Este email já está sendo usado

Realizar Login com o usuário
    ${body_login}    Create Dictionary    email=${EMAIL_USUARIO}    password=12345
    ${resposta_login}    POST On Session
    ...    alias=ServeRestSession
    ...    url=/login
    ...    json=${body_login}
    Set Test Variable    ${RESPOSTA_LOGIN}    ${resposta_login.json()}

Conferir se o Login ocorreu com sucesso
    Dictionary Should Contain Item    ${RESPOSTA_LOGIN}    message    Login realizado com sucesso

Listar os usuários cadastrados
    [Arguments]    ${status_code}
    ${resposta_get_usuarios}    GET On Session
    ...    alias=ServeRestSession
    ...    expected_status=${status_code}
    ...    url=/usuarios

    Set Test Variable    ${RESPOSTA_GET_USUARIOS}    ${resposta_get_usuarios.json()}
    Get Dictionary Items    ${RESPOSTA_GET_USUARIOS}

Retornar um log com a quantidade de usuários cadastrados
    log    A quantidade de usuários cadastrados é: ${RESPOSTA_GET_USUARIOS["quantidade"]}

Retornar um log com os e-mails cadastrados
    Set Test Variable    ${LISTA_USUARIOS}    ${RESPOSTA_GET_USUARIOS["usuarios"]}
    ${result}    Create List    
    FOR    ${usuario}    IN    @{RESPOSTA_GET_USUARIOS["usuarios"]}
        ${email}    set Variable    ${usuario["email"]}
        Append To List    ${result}    ${email}
    END
    Log    ${result}

Selecionar um usuário da lista com base no e-mail e coletar seu ID
    [Arguments]    ${email}
    ${detalhes_usuario}    Set Variable    ${EMPTY}
    ${usuarios}    Set Variable    ${RESPOSTA_GET_USUARIOS["usuarios"]}
    FOR    ${usuario}    IN    @{usuarios}
        ${email_usuario}    Set Variable    ${usuario["email"]}
        IF    '${email_usuario}'=='${email}'
            Log    encontrado o email
            ${nome}    Set Variable    ${usuario["nome"]}
            ${email}    Set Variable    ${usuario["email"]}
            ${senha}    Set Variable    ${usuario["password"]}
            ${id}    Set Variable    ${usuario["_id"]}
            ${administrador}    Set Variable    ${usuario["administrador"]}
        END
    END
    Set Global Variable    ${ID_DO_USUARIO}    ${id}
    Set Global Variable    ${NOME_DO_USUARIO}    ${nome}
    Set Global Variable    ${EMAIL_DO_USUARIO}    ${email}
    Set Global Variable    ${USUARIO_ADM}    ${administrador}
    Set Global Variable    ${SENHA_DO_USUARIO}    ${senha}

Editar a senha do usuário cadastrado
    ${body}    Create Dictionary
    ...    nome=${NOME_DO_USUARIO}
    ...    email=${EMAIL_DO_USUARIO}
    ...    password=6262626262
    ...    administrador=${USUARIO_ADM}
    
    ${resposta_put}    PUT On Session    
    ...    alias=ServeRestSession
    ...    url=/usuarios/${ID_DO_USUARIO}
    ...    json=${body}
    ...    expected_status=200
    
    Set Test Variable    ${RESPOSTA_PUT}    ${resposta_put.json()}

Conferir se a senha foi alterada com sucesso
    Dictionary Should Contain Item    ${RESPOSTA_PUT}    message    Registro alterado com sucesso

Excluir o usuário cadastrado
    ${resposta_delete}    DELETE On Session    
    ...    alias=ServeRestSession
    ...    url=/usuarios/${ID_DO_USUARIO}
    ...    expected_status=200
    
    Set Test Variable    ${RESPOSTA_DELETE}    ${resposta_delete.json()}

Conferir se o usuário foi excluído com sucesso
    Dictionary Should Contain Item    ${RESPOSTA_DELETE}    message    Registro excluído com sucesso
    # ${resposta_get}    GET On Session
    # ...    alias=ServeRestSession
    # ...    expected_status=400
    # ...    url=/usuarios/${ID_USUARIO}
    
    # Set Test Variable    ${RESPOSTA_GET}    ${resposta_get.json()}
    # Dictionary Should Contain Item    ${RESPOSTA_GET}    message    Usuário não encontrado