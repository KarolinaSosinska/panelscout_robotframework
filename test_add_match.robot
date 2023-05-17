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
${MAIN PAGE BUTTON}     xpath=//ul[1]/div[1]
${PLAYER BUTTON}        xpath=//ul[1]/div[2]
${SELECTED PLAYER}      xpath=//tbody/tr[1]/td[1]
${MATCHES BUTTON}       xpath=//ul[2]/div[2]
${MATCHES HEADER}       xpath=//*[text()='Matches']
${ADD MATCH BUTTON}     xpath=//div[1]/main/a/button
${ADD MATCH HEADER}     xpath=//*[text()='Add match']
${MY TEAM HEADER}       xpath=//*[text()='My team']
${SUBMIT BUTTON}        xpath =//*[@type='submit']
${SUBMIT HEADER}        xpath=//*[text()='Submit']
${MY TEAM INPUT}        xpath=//*[@name ='myTeam']
${ENEMY INPUT}      xpath=//*[@name ='enemyTeam']
${MY TEAM SCORE INPUT}      xpath=//*[@name ='myTeamScore']
${ENEMY SCORE INPUT}        xpath=//*[@name ='enemyTeamScore']
${DATE INPUT}       xpath=//div[5]/div/div/input
${MAIN PAGE BUTTON}     xpath =//ul[1]/div[1]
${AGE HEADER}       xpath =//th[3]/span/button/span[1]/div/div[1]
${MATCH AT HOME BUTTON}     xpath=//fieldset/div/label[1]/span[1]
${LAST CREATED MATCH HEADER}      xpath=//*[text()='Last created match']

*** Test Cases ***
Add match
    Open login page
    Type in email
    Type in password
    Click on the Submit button
    Click on Player button
    Click on selected player
    Click on matches button
    Click on add match button
    Type in my team name
    Type in enamy team name
    Type in my team score
    Type in enamy score
    Type in date
    Click on match at home button
    Click on Submit button
    Click on main page button
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
Click on Player button
    Wait until element is visible       ${HEADER}
    Click Element       xpath=//ul[1]/div[2]
Click on selected player
    Wait until element is visible       ${AGE HEADER}
    Click Element       xpath=//tbody/tr[1]/td[1]
Click on matches button
    Wait until element is visible       ${MATCHES HEADER}
    Click Element       xpath=//ul[2]/div[2]
Click on add match button
    Wait until element is visible       ${ADD MATCH HEADER}
    Click Element       xpath=//div[1]/main/a/button
    Wait Until Location Is Not    https://scouts-test.futbolkolektyw.pl/en/players/6026b48956c79737b3f3c624/matches/add
Type in my team name
    Wait Until Element Is Visible    ${MY TEAM HEADER}
    Input Text      ${MY TEAM INPUT}        legia
Type in enamy team name
    Input Text      ${ENEMY INPUT}        wisla
Type in my team score
    Input Text      ${MY TEAM SCORE INPUT}      5
Type in enamy score
    Input Text      ${ENEMY SCORE INPUT}        2
Type in date
    Input Text      ${DATE INPUT}        22022222
    Press Keys    ${DATE INPUT}    TAB
Click on match at home button
    Click Element       xpath=//fieldset/div/label[1]/span[1]
Click on submit button
    Wait until element is visible       ${SUBMIT HEADER}
    Click Element       xpath =//*[@type='submit']
    Wait Until Location Is Not    https://scouts-test.futbolkolektyw.pl/players/6026b48956c79737b3f3c624/matches
Click on main page button
    Click Element       xpath =//ul[1]/div[1]
Assert Dashboard
    Wait until element is visible    ${LAST CREATED MATCH HEADER}
    Title should be    Scouts panel
    Capture Page Screenshot     alert.png
