*** Settings ***
Documentation        New Form Creation.
Test Setup           Open chrome Browser and goto QAbundle instance
Library             SeleniumLibrary
Resource            ../PageObjects/FormOrBundleDelete.robot
Resource            ../PageObjects/Generic.robot
*** Variables ***
${row}   2
${column}   1
*** Test Cases ***

    
Deleting a Form
    [Tags]    Sanity

     ${username_designer}  ${password}=    Generic.Retrieve Username and Password   ${row}   ${column}

     Log    First Value: ${username_designer}

    Generic.Login To QA Instance    ${username_designer}   ${password}
    #FormOrBundleDelete.Delete a form
    FormOrBundleDelete.Delete a Bundle
    Generic.logout
