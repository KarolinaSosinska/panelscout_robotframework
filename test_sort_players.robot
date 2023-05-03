*** Settings ***
Library     SeleniumLibrary
Documentation       Suite description #automated tests for scout website
*** Variables ***
${LOGIN URL}    https://scouts-test.futbolkolektyw.pl/en
${BROWSER}      Chrome
${LOGIN INPUT}      xpath =//div[1]/div/input
${PASSWORD INPUT}       xpath =//form/div/div[1]/div[2]/div/input
${SIGN IN BUTTON}       xpath =//span[1]
${HEADER}       xpath =//h6
${PLAYERS BUTTON}       xpath =//ul[1]/div[2]
${AGE BUTTON}       xpath =//th[3]/span/button
${AGE HEADER}       xpath =//th[3]/span/button/span[1]/div/div[1]

*** Test Cases ***
Sort players by age
    Open login page
    Type in email
    Type in password
    Click on the Submit button
    Click on the Players button
    Click on the Age button
    [Teardown]      Close Browser

*** Keywords ***
Open login page
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Title Should Be     Scouts panel - sign in
Type in email
    Input Text   ${LOGIN INPUT}   user07@getnada.com
Type in password
    Input Text   ${PASSWORD INPUT}   Test-1234
Click on the Submit button
    Click Element       xpath =//span[1]
Click on the Players button
    Wait until element is visible    ${HEADER}
    Click Element       xpath =//ul[1]/div[2]
Click on the Age button
    Wait until element is visible    ${AGE HEADER}
    Click Element       xpath =//th[3]/span/button

