*** Settings ***
Documentation    Essa suíte reforça o estudo sobre a estrutura de repetição FOR e estrutura condicional IF ELSE

*** Variables ***
@{CARROS_VOLKSWAGEN}    Fusca    Gol    Voyage    Parati    Saveiro    Apollo    Logus    Kombi    Golf

*** Test Cases ***
Carros que marcaram época na Volkswagen:
    Listando os carros

*** Keywords ***
Listando os carros
    Log To Console    ${\n}
    FOR    ${CARROS}    IN    @{CARROS_VOLKSWAGEN}
        Log To Console   ${CARROS}
        IF    '${CARROS}'=='Parati'
            Log To Console    Obs.: A ${CARROS} é o meu carro favorito!
        END
    END