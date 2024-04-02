*** Settings ***
Documentation    Essa suíte reforça o estudo sobre testes de API utilizando como base a API do site https://serverest.dev/
Resource    ../resources/serve_rest_api.resource

*** Test Cases ***
Caso de teste 01: Cadastrar um novo usuário no ServeRest com sucesso
    [Documentation]    Esse test case cria um usuário na API REST gratuita https://serverest.dev/
    [Tags]    cadasto_usuario
    Criar um novo usuário
    Cadastrar o usuário criado    email=${EMAIL_USUARIO}    status_code=201
    Verificar se o usuário foi cadastrado com sucesso

Caso de teste 02: Consultar os dados de um novo usuário
    [Documentation]    Esse test case consulta os dados de um usuário na API REST gratuita https://serverest.dev/
    [Tags]    consulta_usuario
    Criar um novo usuário
    Cadastrar o usuário criado    email=${EMAIL_USUARIO}    status_code=201
    Consultar os dados do novo usuário    status_code=200
    Conferir os dados retornados    email=${EMAIL_USUARIO}

Caso de teste 03: Tentar cadastrar um usuário já existente
    [Documentation]    Esse test case tenta cadastrar um usuário já existente na API REST gratuita https://serverest.dev/
    [Tags]    cadastro_usuario_existente
    Criar um novo usuário
    Cadastrar o usuário criado    email=${EMAIL_USUARIO}    status_code=201
    Repetir cadastro
    Verificar se o sistema bloqueia a criação de um usuário já cadastrado

Caso de teste 04: Logar com o novo usuário criado
    [Documentation]    Esse test case faz o login de um novo usuário na API REST gratuita https://serverest.dev/
    [Tags]    login_usuario
    Criar um novo usuário
    Cadastrar o usuário criado    email=${EMAIL_USUARIO}    status_code=201
    Realizar Login com o usuário
    Conferir se o Login ocorreu com sucesso

Caso de teste 05: Listar todos os usuários cadastrados
    [Documentation]    Esse test case lista todos os usuários já cadastrados na API REST gratuita https://serverest.dev/
    [Tags]    consulta_todos_usuarios
    Criar um novo usuário
    Cadastrar o usuário criado    email=${EMAIL_USUARIO}    status_code=201
    Listar os usuários cadastrados    status_code=200
    Retornar um log com a quantidade de usuários cadastrados
    Retornar um log com os e-mails cadastrados

Caso de teste 06: Editar a senha de um usuário
    [Documentation]    Esse test case realiza a edição da senha de um usuário já cadastrado na API REST gratuita https://serverest.dev/
    [Tags]    edita_senha_usuario
    Criar um novo usuário
    Cadastrar o usuário criado    email=${EMAIL_USUARIO}    status_code=201
    Listar os usuários cadastrados    status_code=200
    Selecionar um usuário da lista com base no e-mail e coletar seu ID    email=${EMAIL_USUARIO}
    Editar a senha do usuário selecionado
    Conferir se a senha foi alterada com sucesso

Caso de teste 07: Editar o nome de um usuário
    [Documentation]    Esse test case realiza a edição do nome de um usuário já cadastrado na API REST gratuita https://serverest.dev/
    [Tags]    edita_nome_usuario
    Criar um novo usuário
    Cadastrar o usuário criado    email=${EMAIL_USUARIO}    status_code=201
    Listar os usuários cadastrados    status_code=200
    Selecionar um usuário da lista com base no e-mail e coletar seu ID    email=${EMAIL_USUARIO}
    Editar o nome do usuário selecionado
    Conferir se o nome foi alterado com sucesso

Caso de teste 08: Editar os privilégios de administrador de um usuário
    [Documentation]    Esse test case realiza a edição dos privilégios de administrador de um usuário já cadastrado na API REST gratuita https://serverest.dev/
    [Tags]    edita_priv_adm
    Criar um novo usuário
    Cadastrar o usuário criado    email=${EMAIL_USUARIO}    status_code=201
    Listar os usuários cadastrados    status_code=200
    Selecionar um usuário da lista com base no e-mail e coletar seu ID    email=${EMAIL_USUARIO}
    Editar os privilégios de administrador do usuário selecionado
    Conferir se os privilégios de administrador foram alterados com sucesso

Caso de teste 09: Editar o e-mail de um usuário
    [Documentation]    Esse test case realiza a edição do e-mail de um usuário já cadastrado na API REST gratuita https://serverest.dev/
    [Tags]    edita_email_usuario
    Criar um novo usuário
    Cadastrar o usuário criado    email=${EMAIL_USUARIO}    status_code=201
    Listar os usuários cadastrados    status_code=200
    Selecionar um usuário da lista com base no e-mail e coletar seu ID    email=${EMAIL_USUARIO}
    Editar e-mail do usuário selecionado
    Conferir se o e-mail foi alterado com sucesso

Caso de teste 10: Excluir um usuário
    [Documentation]    Esse test case exclui um usuário cadastrado na API REST gratuita https://serverest.dev/
    [Tags]    exclui_usuario
    Criar um novo usuário
    Cadastrar o usuário criado    email=${EMAIL_USUARIO}    status_code=201
    Listar os usuários cadastrados    status_code=200
    Selecionar um usuário da lista com base no e-mail e coletar seu ID    email=${EMAIL_USUARIO}
    Excluir o usuário cadastrado
    Conferir se o usuário foi excluído com sucesso