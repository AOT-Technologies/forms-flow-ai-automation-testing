*** Settings ***
Documentation     Upload a file.
Test Setup     Open chrome Browser and goto QAbundle instance
Library           SeleniumLibrary
Library           DateTime
Resource            ../PageObjects/FormsLandingPAge.robot
Resource            ../PageObjects/Generic.robot
Suite Teardown    Close Browser


*** Variables ***
${row}  2
${column}  1
*** Test Cases ***

Upload Form
    ${username_designer}  ${password}=    Generic.Retrieve Username and Password   ${row}   ${column}

     Log    First Value: ${username_designer}

    Generic.Login To QA Instance    ${username_designer}   ${password}
    FormsLandingPAge.Upload Form
