*** Settings ***
Documentation    Essa suíte reforça o estudo sobre o uso variáveis do tipo lista

*** Variables ***

&{MESES_DO_ANO_QUANTIDADE_DE_DIAS}    mes1=Janeiro    mes1_dias=31 dias
...                                   mes2=Fevereiro    mes2_dias=28 dias, quando em ano bissexto possui 29 dias
...                                   mes3=Março    mes3_dias=31 dias
...                                   mes4=Abril    mes4_dias=30 dias 
...                                   mes5=Maio    mes5_dias=31 dias
...                                   mes6=Junho    mes6_dias=30 dias
...                                   mes7=Julho    mes7_dias=31 dias
...                                   mes8=Agosto    mes8_dias=31 dias
...                                   mes9=Setembro    mes9_dias=30 dias
...                                   mes10=Outubro    mes10_dias=31 dias
...                                   mes11=Novembro    mes11_dias=30 dias
...                                   mes12=Dezembro    mes12_dias=31 dias

*** Test Cases ***

Meses do ano com a quantidade de dias
    [Documentation]    Este teste irá exibir os meses do ano e ao lado de cada mês a quantidade de dias que ele possui
    [Tags]             meses_quantidade_dias
    Exibir os meses do ano e ao lado exibir quantos dias tem cada mês

*** Keywords ***
Exibir os meses do ano e ao lado exibir quantos dias tem cada mês
    Log To Console    Mês de ${MESES_DO_ANO_QUANTIDADE_DE_DIAS.mes1} possui ${MESES_DO_ANO_QUANTIDADE_DE_DIAS.mes1_dias}
    Log To Console    Mês de ${MESES_DO_ANO_QUANTIDADE_DE_DIAS.mes2} possui ${MESES_DO_ANO_QUANTIDADE_DE_DIAS.mes2_dias}
    Log To Console    Mês de ${MESES_DO_ANO_QUANTIDADE_DE_DIAS.mes3} possui ${MESES_DO_ANO_QUANTIDADE_DE_DIAS.mes3_dias}
    Log To Console    Mês de ${MESES_DO_ANO_QUANTIDADE_DE_DIAS.mes4} possui ${MESES_DO_ANO_QUANTIDADE_DE_DIAS.mes4_dias}
    Log To Console    Mês de ${MESES_DO_ANO_QUANTIDADE_DE_DIAS.mes5} possui ${MESES_DO_ANO_QUANTIDADE_DE_DIAS.mes5_dias}
    Log To Console    Mês de ${MESES_DO_ANO_QUANTIDADE_DE_DIAS.mes6} possui ${MESES_DO_ANO_QUANTIDADE_DE_DIAS.mes6_dias}
    Log To Console    Mês de ${MESES_DO_ANO_QUANTIDADE_DE_DIAS.mes7} possui ${MESES_DO_ANO_QUANTIDADE_DE_DIAS.mes7_dias}
    Log To Console    Mês de ${MESES_DO_ANO_QUANTIDADE_DE_DIAS.mes8} possui ${MESES_DO_ANO_QUANTIDADE_DE_DIAS.mes8_dias}
    Log To Console    Mês de ${MESES_DO_ANO_QUANTIDADE_DE_DIAS.mes9} possui ${MESES_DO_ANO_QUANTIDADE_DE_DIAS.mes9_dias}
    Log To Console    Mês de ${MESES_DO_ANO_QUANTIDADE_DE_DIAS.mes10} possui ${MESES_DO_ANO_QUANTIDADE_DE_DIAS.mes10_dias}
    Log To Console    Mês de ${MESES_DO_ANO_QUANTIDADE_DE_DIAS.mes11} possui ${MESES_DO_ANO_QUANTIDADE_DE_DIAS.mes11_dias}
    Log To Console    Mês de ${MESES_DO_ANO_QUANTIDADE_DE_DIAS.mes12} possui ${MESES_DO_ANO_QUANTIDADE_DE_DIAS.mes12_dias}