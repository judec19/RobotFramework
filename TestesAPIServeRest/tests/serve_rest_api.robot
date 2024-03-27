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

Caso de teste 05: Listar todos os usuários cadastrados
    Criar um novo usuário
    Cadastrar o usuário criado    email=${EMAIL_USUARIO}    status_code=201
    Listar os usuários cadastrados    status_code=200
    Retornar um log com a quantidade de usuários cadastrados
    Retornar um log com os e-mails cadastrados

Caso de teste 06: Editar a senha de um usuário
    Criar um novo usuário
    Cadastrar o usuário criado    email=${EMAIL_USUARIO}    status_code=201
    Listar os usuários cadastrados    status_code=200
    Selecionar um usuário da lista com base no e-mail e coletar seu ID    email=patrcik_estrela@hotmail.com.br
    Editar a senha do usuário cadastrado
    Conferir se a senha foi alterada com sucesso

# # Caso de teste 07: Excluir um usuário
# #     Criar um novo usuário
# #     Cadastrar o usuário criado    email=${EMAIL_USUARIO}    status_code=201
# #     Excluir o usuário cadastrado
# #     Conferir se o usuário foi excluído com sucesso