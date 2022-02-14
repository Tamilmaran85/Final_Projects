*** Settings ***
Documentation   This file contains reusable keywords

Library     SeleniumLibrary

*** Variables ***
${BROWSER_NAME}         chrome
${URL}      https://phptravels.net/

*** Keywords ***
Launch Browser
    Set Local Variable    ${driver}        chromedriver.exe

    IF    '${BROWSER_NAME}' == 'firefox'
        Set Local Variable    ${driver}        geckodriver.exe
    ELSE IF  '${BROWSER_NAME}' == 'edge'
        Set Local Variable    ${driver}        msedgedriver.exe
    ELSE IF  '${BROWSER_NAME}' == 'safari'
        Set Local Variable    ${driver}        safaridriver.exe
    END

    Open Browser      browser=${BROWSER_NAME}      executable_path=${EXECDIR}${/}drivers${/}${driver}
    Maximize Browser Window
    Set Selenium Implicit Wait    30s
    Set Screenshot Directory    ${EXECDIR}${/}screenshot
    Go To    url=${URL}
    Click Element    xpath=//a[@class='theme-btn theme-btn-small theme-btn-transparent ml-1 waves-effect']

End Browser
#    Capture Page Screenshot
    Close Browser