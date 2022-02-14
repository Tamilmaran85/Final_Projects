*** Settings ***
Documentation   this file handles all the operation in the login page of openemr

Resource    ../base/common_functionality.resource

*** Variables ***
${USERNAME_LOCATOR}     name=email
${PASSWORD_LOCATOR}     name=password
${LOGIN_LOCATOR}        xpath=//button[@class='btn btn-default btn-lg btn-block effect ladda-button waves-effect']
${ERROR_LOCATOR}        xpath=//div[@class='alert alert-danger failed']

*** Keywords ***
Enter Username
    [Arguments]     ${username}
    Input Text    ${USERNAME_LOCATOR}    ${username}

Enter Password
    [Arguments]     ${password}
    Input Password    ${PASSWORD_LOCATOR}    ${password}

Click Login
        Click Element    ${LOGIN_LOCATOR}

Validate Invalid Error Message
    [Arguments]     ${expected_error}
    Element Should Contain    ${ERROR_LOCATOR}       ${expected_error}