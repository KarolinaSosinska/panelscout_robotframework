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

*** Test Cases ***
Login to the system
    Open login page
    Type in email
    Type in password
    Click on the Submit button
    Assert dashboard
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
Assert Dashboard
    Wait until element is visible    ${HEADER}
    Title should be    Scouts panel
    Capture Page Screenshot     alert.png
