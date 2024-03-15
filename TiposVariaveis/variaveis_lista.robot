*** Settings ***
Documentation    Essa suíte reforça o estudo sobre variáveis do tipo lista

*** Variables ***

@{MESES_DO_ANO}    Janeiro    Fevereiro    Março    Abril    Maio    Junho    Julho    Agosto    Setembro    Outubro    Novembro    Dezembro

*** Test Cases ***

Meses do ano
    [Documentation]    Este teste irá exibir no log os meses do ano
    [Tags]             meses_do_ano
    Exibir os meses do ano no log
    

*** Keywords ***

Exibir os meses do ano no log
    Log To Console    ${MESES_DO_ANO[0]}
    Log To Console    ${MESES_DO_ANO[1]}
    Log To Console    ${MESES_DO_ANO[2]}
    Log To Console    ${MESES_DO_ANO[3]}
    Log To Console    ${MESES_DO_ANO[4]}
    Log To Console    ${MESES_DO_ANO[5]}
    Log To Console    ${MESES_DO_ANO[6]}
    Log To Console    ${MESES_DO_ANO[7]}
    Log To Console    ${MESES_DO_ANO[8]}
    Log To Console    ${MESES_DO_ANO[9]}
    Log To Console    ${MESES_DO_ANO[10]}
    Log To Console    ${MESES_DO_ANO[11]}