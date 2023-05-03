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
${ADD PLAYER LABEL}      xpath=//*[text()='Add player']
${ADD PLAYER BUTTON}        xpath=//div[2]/div/div/a/button
${ADD PLAYER HEADER}        xpath=//span[text()='Add player']
${LEG SELECTION}        xpath =//div[8]/div/div/div
${EMAIL INPUT}      xpath =//div[1]/div/div/input
${NAME INPUT}       xpath =//div[2]/div/div/input
${SURNAME INPUT}        xpath =//div[3]/div/div/input
${PHONE INPUT}      xpath =//div[4]/div/div/input
${WEIGH INPUT}      xpath =//div[5]/div/div/input
${HEIGHT INPUT}     xpath =//div[6]/div/div/input
${AGE INPUT}        xpath =//div[7]/div/div/input
${CLUB INPUT}       xpath =//div[9]/div/div/input
${LEVEL INPUT}      xpath =//div[10]/div/div/input
${MAIN POSITION INPUT}      xpath =//div[11]/div/div/input
${SECOND POSITION INPUT}        xpath=//div[12]/div/div/input
${DISTRICT SELECTION}       xpath =//div[13]/div/div/div
${ACHIEVEMENTS INPUT}       xpath =//div[14]/div/div/input
${SUBMIT BUTTON}        xpath =//*[contains(@type, 'submit')]
${SUBMIT LABLE}     xpath=//*[text()= 'Submit']
${MAIN PAGE BUTTON}     xpath =//ul[1]/div[1]
${NEW PLAYER}       xpath=//span[text()= 'Johna Smith']
${LOGO}     xpath=//*[@title='Logo Scouts Panel']
*** Test Cases ***
Login to the system
    set selenium implicit wait    10seconds
    Open login page
    Type in email
    Type in password
    Click on the Submit button
    Click on Add Player button
    Type in Email of the player
    Type in name
    Type in surname
    Type in phone
    Type in weight
    Type in height
    Type in age
    Click on leg selection
    Type in club
    Type in level
    Type in main position
    Type in second position
    Click on district selection
    Type in achievements
    Click on the submit player button
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
Click on Add Player button
    Wait Until Location Is Not    https://scouts-test.futbolkolektyw.pl/en
    Wait Until Element Is Visible       ${ADD PLAYER LABEL}
    Click Element       xpath=//div[2]/div/div/a/button
Type in Email of the player
    Wait Until Location Is Not    https://scouts-test.futbolkolektyw.pl/en/players/add
    Wait Until Element Is Visible       ${ADD PLAYER HEADER}
    Input Text      ${EMAIL INPUT}      xxx@gmail.com
Type in name
    Input Text      ${NAME INPUT}       Johna
Type in surname
    Input Text      ${SURNAME INPUT}        Smith
Type in phone
    Input Text      ${PHONE INPUT}      666777999
Type in weight
    Input Text      ${WEIGH INPUT}      79
Type in height
    Input Text      ${HEIGHT INPUT}     185
Type in age
    Input Text      ${AGE INPUT}        12122000
Click on leg selection
    Click Element       ${LEG SELECTION}
    Press Keys       ${LEG SELECTION}       Enter
Type in club
    Input Text      ${CLUB INPUT}       TCS
Type in level
    Input Text      ${LEVEL INPUT}      2
Type in main position
    Input Text      ${MAIN POSITION INPUT}      Goalkeeper
Type in second position
    Input Text      ${SECOND POSITION INPUT}        Center-back
Click on district selection
    Click Element       xpath=//div[13]/div/div
    Press Keys       ${DISTRICT SELECTION}    Enter
    Press Keys       ${DISTRICT SELECTION}    Tab
Type in achievements
    Input Text      ${ACHIEVEMENTS INPUT}       Top 10 best goalkeeper in 2020
    Scroll Element Into View    ${SUBMIT BUTTON}
Click on the submit player button
    Click Element       xpath =//*[contains(@type, 'submit')]
    Wait until element is visible       ${NEW PLAYER}
Click on main page button
    Click Element       xpath =//ul[1]/div[1]
    Wait Until Element Is Visible    ${LOGO}
Assert Dashboard
    Wait Until Location Is    https://scouts-test.futbolkolektyw.pl/en
    Title should be    Scouts panel
    Capture Page Screenshot     alert.png

