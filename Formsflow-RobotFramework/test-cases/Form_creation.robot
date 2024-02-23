*** Settings ***
Documentation     This testcase is for New Form Creation.
Test Setup        Open chrome Browser and goto QAbundle instance
Library           SeleniumLibrary
Library           DateTime
Resource          ../PageObjects/FormCreate.robot
Resource          ../PageObjects/Generic.robot
Test Teardown     Close Browser

*** Variables ***
${row}   2
${column}   1
*** Test Cases ***

Newform_Create

    ${username_designer}  ${password}=    Generic.Retrieve Username and Password   ${row}   ${column}

     Log    First Value: ${username_designer}

    Generic.Login To QA Instance    ${username_designer}   ${password}
    FormCreate.Create new Form
    Generic.validate success message after form create
    FormCreate.check form status
    Generic.logout

Create duplicate form
    ${username_designer}  ${password}=    Generic.Retrieve Username and Password   ${row}   ${column}

     Log    First Value: ${username_designer}

    Generic.Login To QA Instance    ${username_designer}   ${password}
    FormCreate.Create Duplicate Form
    Generic.validate success message after form create
    Generic.logout