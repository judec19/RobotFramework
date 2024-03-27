*** Settings ***
Documentation    Essa suíte reforça o estudo sobre testes de API utilizando como base a API do site https://serverest.dev/
Resource    ../resources/serve_rest_api.resource

*** Test Cases ***
Caso de teste 01: Cadastrar um novo usuário no ServeRest com sucesso
    Criar um novo usuário
    Cadastrar o usuário criado    email=${EMAIL_USUARIO}    status_code=201
    Verificar se o usuário foi cadastrado com sucesso

Caso de teste 02: Consultar os dados de um novo usuário
    Criar um novo usuário
    Cadastrar o usuário criado    email=${EMAIL_USUARIO}    status_code=201
    Consultar os dados do novo usuário    status_code=200
    Conferir os dados retornados    email=${EMAIL_USUARIO}

Caso de teste 03: Tentar cadastrar um usuário já existente
    Criar um novo usuário
    Cadastrar o usuário criado    email=${EMAIL_USUARIO}    status_code=201
    Repetir cadastro
    Verificar se o sistema bloqueia a criação de um usuário já cadastrado

Caso de teste 04: Logar com o novo usuário criado
    Criar um novo usuário
    Cadastrar o usuário criado    email=${EMAIL_USUARIO}    status_code=201
    Realizar Login com o usuário
    Conferir se o Login ocorreu com sucesso