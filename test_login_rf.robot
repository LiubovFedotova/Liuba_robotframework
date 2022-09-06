*** Settings ***
Library     SeleniumLibrary
Documentation   Suite description #automated tests for scout website

*** Variables ***
${LOGIN URL}    https://scouts-test.futbolkolektyw.pl/en
${BROWSER}  Chrome
${EMAILINPUT}   xpath= //*[@id='login']
${PASSWORDINPUT}    xpath=//*[@id='password']
${SIGNINBUTTON}     xpath=//*[text()= 'Sign in']
${PAGELOGO}     xpath=//*/div[2]/div/div/a
${VALIDATIONSIGNIN}     xpath = "//*/div/div[1]/div[3]/span"
${NAMEINPUT}   xpath= // *[@name='name']
${SURNAMEINPUT}   xpath= // *[@name='surname']
${AGEINPUT}   xpath= // *[@name='age']
${MAINPOSITIONINPUT}   xpath= // *[@name='mainPosition']

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
    Type in Name
    Type in Surname
    Type in Age
    Type in Main Position
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
    Click Element       xpath=//*[text()= 'Sign in']
Assert Dushboard
    wait until element is visible        ${PAGELOGO}
    Title Should Be     Scouts panel
    Capture Page Screenshot     alert.png
Click on the Sign Out button
    wait until element is visible        xpath=//*[text()= 'Sign out']
    Click Element       xpath=//*[text()= 'Sign out']
Assert LoginPage
    wait until element is visible        xpath=//*[text()= 'Sign in']
    Title Should Be     Scouts panel - sign in
Check validation message
    wait until element is visible        xpath=//*/div/div[1]/div[3]/span
    Page Should Contain Element         xpath=//*/div/div[1]/div[3]/span
Click on the Language button
    wait until element is visible        xpath=//*/ul[2]/div[1]/div[2]/span
    Click Element       xpath=//*/ul[2]/div[1]/div[2]/span
Assert Language Switch
    Page Should Contain Element         xpath=//*[text()= 'English']
Click on the AddPlayer button
    wait until element is visible        xpath=//*/div[2]/div/div/a
    Click Element       xpath=//*/div[2]/div/div/a
Type in Name
    Input Text  ${NAMEINPUT}       Test
Type in Surname
    Input Text  ${SURNAMEINPUT}       Test
Type in Age
    Input Text  ${AGEINPUT}       01.01.2001
Type in Main Position
    Input Text  ${MAINPOSITIONINPUT}       test
Click on the Submit button
    Click Element       xpath=// *[text()= 'Submit']
Assert Edit Page
    Wait Until Page Contains Element         xpath= //*[contains(text(),'Edit player')]
    Title Should Be     Edit player Test Test
Click on the Clear button
    Click Element       xpath=// *[text()= 'Clear']
Assert Add Page
    Title Should Be     Add player






