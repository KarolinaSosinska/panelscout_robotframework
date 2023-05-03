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
${SIGN OUT BUTTON}      xpath =//ul[2]/div[2]
${HEADER PAGE LOGOUT}    xpath =//div[1]/h5
*** Test Cases ***
Logout of the system
    Open login page
    Type in email
    Type in password
    Click on the Submit button
    Click on the Sign out button
    Assert login page
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
Click on the Sign out button
    Wait until element is visible    ${HEADER}
    Click Element       xpath =//ul[2]/div[2]
Assert login page
    Wait until element is visible    ${HEADER PAGE LOGOUT}
    Title should be    Scouts panel - sign in
    Capture Page Screenshot     alert.png