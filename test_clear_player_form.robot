*** Settings ***
Library     SeleniumLibrary
Documentation       Suite description #automated tests for scout website
*** Variables ***
${LOGIN URL}    https://scouts-test.futbolkolektyw.pl/en
${BROWSER}      Chrome
${LOGIN INPUT}      xpath =//div[1]/div/input
${PASSWORD INPUT}       xpath =//form/div/div[1]/div[2]/div/input
${SIGN IN BUTTON}       xpath =//span[1]
${HEADER}       xpath =//header/div/h6
${AGE HEADER}       xpath =//th[3]/span/button/span[1]/div/div[1]
${SELECTED PLAYER}      xpath=//tbody/tr
${CLEAR BUTTON}     xpath=//button[2]
${CLEAR LABEL}      xpath=//*[text()='Clear']
${MAIN PAGE BUTTON}     xpath =//ul[1]/div[1]
${LAST UPDATED PLAYER BUTTON}      xpath=//a[2]/button
${LAST UPDATED PLAYER HEADER}      xpath=//*[text()='Last updated player']
${EMAIL LABEL}      xpath=//*[text()='E-mail']
*** Test Cases ***
Login to the system
    Open login page
    Type in email
    Type in password
    Click on the Submit button
    Click on Player button
    Click on selected player
    Click on clear button
    Click on main page button
    Click On Last Updated Player
    Assert updated player
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
Click on Player button
    Wait until element is visible       ${HEADER}
    Click Element       xpath=//ul[1]/div[2]
Click on selected player
    Wait until element is visible       ${AGE HEADER}
    Click Element       xpath=//tbody/tr
Click on clear button
    Wait Until Element Is Visible       ${CLEAR LABEL}
    Click Element       xpath=//button[2]
Click on main page button
    Click Element       xpath =//ul[1]/div[1]
Click on last updated player
    Wait Until Location Is Not      https://scouts-test.futbolkolektyw.pl/en
    Wait until element is visible    ${LAST UPDATED PLAYER HEADER}
    Click Element    xpath=//a[2]/button
Assert updated player
    Wait Until Location Is Not    https://scouts-test.futbolkolektyw.pl/en/players/6026b48956c79737b3f3c624/edit
    Wait Until Element Is Visible       ${EMAIL LABEL}
    Title should be    Edit player Brzęczyszcykiewić Zażółć Gęślą Jaźń
    Capture Page Screenshot     alert.png
