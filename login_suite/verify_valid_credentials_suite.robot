*** Settings ***


Resource    ../pages/login_page.resource
Resource    ../pages/main_page.resource

Library     DataDriver      file=../test_data/phpData.xlsx      sheet_name=VerifyValidCredentialsTemplate
Library    SeleniumLibrary

Test Setup      Launch Browser
Test Teardown   End Browser

Test Template   Verify Valid Credentials Template


*** Test Cases ***
TC1
    Open Browser    browser=chrome      executable_path=${EXECDIR}${/}drivers${/}chromedriver.exe
    Maximize Browser Window
    Set Selenium Implicit Wait    30s
    Go To    url=https://phptravels.net/
    Click Element    xpath=//a[@class='theme-btn theme-btn-small theme-btn-transparent ml-1 waves-effect']
    Input Text    name=email        tamilmaranpanneer@gmail.com
    Input Password    name=password    dfgts45785
    Click Element    xpath=//button[@class='btn btn-default btn-lg btn-block effect ladda-button waves-effect']
    Sleep    2s
    Close Browser

TC2
    Open Browser      browser=chrome        executable_path=${EXECDIR}${/}drivers${/}chromedriver.exe
    Maximize Browser Window
    Set Selenium Implicit Wait    30s
    Go To    url= https://phptravels.net/
    Click Element    xpath=//button[@id='currency']
    Click Element    xpath=//a[normalize-space()='INR']
    Click Element    xpath=//a[normalize-space()='flights']
    Click Element    xpath=//select[@id='flight_type']
    Click Element    xpath=//option[@value='business']
    Click Element    xpath=//input[@id='autocomplete']
    Input Text    xpath=//input[@id='autocomplete']       LAX
    Input Text    xpath=//input[@id='autocomplete2']      DAL
    Click Element    xpath=//span[@class='ladda-label']
    Close Browser

TC3



*** Keywords ***
Verify Valid Credentials Template
    [Arguments]     ${username}     ${password}     ${expected_title}
    Enter Username  ${username}
    Enter Password   ${password}
    Click Login
    Main Page Title Should be       ${expected_title}

TC4



*** Keywords ***
Verify Valid Credentials Template
    [Arguments]     ${username}     ${password}     ${expected_title}
    Enter Username  ${username}
    Enter Password   ${password}
    Click Login
    Main Page Title Should be       ${expected_title}
