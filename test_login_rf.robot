*** Settings ***
Library     SeleniumLibrary
Documentation   Suite description #automated tests for scout website

*** Variables ***
${LOGIN URL}    https://scouts.futbolkolektyw.pl/en/
${BROWSER}  Chrome
${EMAILINPUT}   xpath= //*[@id='login']
${PASSWORDINPUT}    xpath= //*[@id='password']
${SIGNINBUTTON}     xpath= //*[text()= 'Sign in']
${SIGNOUTBUTTON}    xpath= //*[text()= 'Sign out']
${SUBMITBUTTON}     xpath= //*[text()= 'Submit']
${CLEARBUTTON}      xpath= //*[text()= 'Clear']
${LANGUAGEBUTTON}       xpath= //*/ul[2]/div[1]/div[2]/span
${ADDPLAYERBUTTON}      xpath= //*/div[2]/div/div/a
${PAGELOGO}     xpath= //*/div[2]/div/div/a
${VALIDATIONSIGNIN}     xpath= //*/div/div[1]/div[3]/span
${EMAILADDFORMINPUT}    xpath=//*[@name='email']
${NAMEINPUT}   xpath= //*[@name='name']
${SURNAMEINPUT}   xpath= //*[@name='surname']
${PHONEINPUT}   xpath= //*[@name='phone']
${WEIGHTINPUT}  xpath= //*[@name='weight']
${HEIGHTINPUT}  xpath= //*[@name='height']
${AGEINPUT}   xpath= //*[@name='age']
${LEGDROPDOWN}  xpath = //*[@id='mui-component-select-leg']
${RIGHTLEG}  xpath = //ul/li[1]
${CLUBINPUT}    xpath= //*[@name='club']
${LEVELINPUT}   xpath= //*[@name='level']
${MAINPOSITIONINPUT}   xpath= //*[@name='mainPosition']
${SECONDPOSITIONINPUT}  xpath= //*[@name='secondPosition']
${DISTRICTDROPDOWN}     xpath= //*[@id='mui-component-select-district']
${LUBLINDISTRICT}   xpath= //ul/li[3]
${ACHIEVEMENTIONINPUT}  xpath= //*[@name='achievements']
${LACZYIONINPUT}    xpath= //*[@name='webLaczy']
${MINUTIONINPUT}    xpath= //*[@name='web90']
${FACEBOOKINPUT}     xpath= //*[@name='webFB']
${POLSKILANGUGEON}       xpath= //*[text()= 'English']
${EDITPAGE}     xpath= //*[contains(text(),'Edit player')]

*** Test Cases ***
Log in to the system
    Open login page
    Type in email
    Type in password
    Click on the Sign In button
    Assert Dushboard
    [Teardown]  Close Browser

Log out of the system
    Open login page
    Type in email
    Type in password
    Click on the Sign In button
    Click on the Sign Out button
    Assert LoginPage
    [Teardown]  Close Browser

Invalid Log in to the system
    Open login page
    Type in email
    Type in invalid password
    Click on the Sign In button
    Check validation message
    Assert LoginPage
    [Teardown]  Close Browser

Language Switch
    Open login page
    Type in email
    Type in password
    Click on the Sign In button
    Click on the Language button
    Assert Language Switch
    [Teardown]  Close Browser

Add Player to Database
    Open login page
    Type in email
    Type in password
    Click on the Sign In button
    Click on the AddPlayer button
    Type in email of Add Form
    Type in Name
    Type in Surname
    Type in Phone
    Type in Weight
    Type in Height
    Type in Age
    Click on the Leg
    Type in Club
    Type in Level
    Type in Main Position
    Type in Second Position
    Click on the District
    Type in Achievement
    Type in Laczy Nas Pilka
    Type in Ninety Minute
    Type in Facebook
    Click on the Submit button
    Assert Edit Page
    [Teardown]  Close Browser

Clear add player form
    Open login page
    Type in email
    Type in password
    Click on the Sign In button
    Click on the AddPlayer button
    Type in Name
    Type in Surname
    Type in Age
    Type in Main Position
    Click on the Clear button
    Assert Add Page
    [Teardown]  Close Browser

*** Keywords ***
Open login page
    Open Browser        ${LOGIN URL}  ${BROWSER}
    Title Should Be     Scouts panel - sign in
Type in email
    Input Text  ${EMAILINPUT}       user01@getnada.com
Type in password
    Input Text  ${PASSWORDINPUT}        Test-1234
Type in invalid password
    Input Text  ${PASSWORDINPUT}        Test-1111
Click on the Sign In button
    Click Element       ${SIGNINBUTTON}
Assert Dushboard
    wait until element is visible        ${PAGELOGO}
    Title Should Be     Scouts panel
    Capture Page Screenshot     alert.png
Click on the Sign Out button
    wait until element is visible        ${SIGNOUTBUTTON}
    Click Element       ${SIGNOUTBUTTON}
Assert LoginPage
    wait until element is visible        ${SIGNINBUTTON}
    Title Should Be     Scouts panel - sign in
    Capture Page Screenshot     alert.png
Check validation message
    wait until element is visible        ${VALIDATIONSIGNIN}
    Page Should Contain Element         ${VALIDATIONSIGNIN}
Click on the Language button
    wait until element is visible        ${LANGUAGEBUTTON}
    Click Element       ${LANGUAGEBUTTON}
Assert Language Switch
    Page Should Contain Element         ${POLSKILANGUGEON}
    Capture Page Screenshot     alert.png
Click on the AddPlayer button
    wait until element is visible        ${ADDPLAYERBUTTON}
    Click Element       ${ADDPLAYERBUTTON}
Type in email of Add Form
    wait until element is visible        ${SUBMITBUTTON}
    Input Text  ${EMAILADDFORMINPUT}       Test@gmail.com
Type in Name
    Input Text  ${NAMEINPUT}       Test
Type in Surname
    Input Text  ${SURNAMEINPUT}       Test
Type in Phone
    Input Text     ${PHONEINPUT}    111111111
Type in Weight
    Input Text     ${WEIGHTINPUT}    100
Type in Height
    Input Text    ${HEIGHTINPUT}    190
Type in Age
    Input Text  ${AGEINPUT}       01.01.2001
Click on the Leg
    Click Element       ${LEGDROPDOWN}
    Click Element       ${RIGHTLEG}
Type in Club
    Input Text  ${CLUBINPUT}       test
Type in Level
    Input Text  ${LEVELINPUT}       test
Type in Main Position
    Input Text  ${MAINPOSITIONINPUT}       test
Type in Second Position
    Input Text  ${SECONDPOSITIONINPUT}       test
Click on the District
    Click Element       ${DISTRICTDROPDOWN}
    Click Element       ${LUBLINDISTRICT}
Type in Achievement
    Input Text  ${ACHIEVEMENTIONINPUT}       test
Type in Laczy Nas Pilka
    Input Text  ${LACZYIONINPUT}       test
Type in Ninety Minute
    Input Text  ${MINUTIONINPUT}       test
Type in Facebook
    Input Text  ${FACEBOOKINPUT}       test
Click on the Submit button
    Click Element       ${SUBMITBUTTON}
Assert Edit Page
    Wait Until Page Contains Element         ${EDITPAGE}
    Title Should Be     Edit player Test Test
    Capture Page Screenshot     alert.png
Click on the Clear button
    Click Element       ${CLEARBUTTON}
Assert Add Page
    Title Should Be     Add player
    Capture Page Screenshot     alert.png






