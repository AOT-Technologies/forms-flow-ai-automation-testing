*** Settings ***
Documentation     Form BundlingRBAC.
Test Setup        Open chrome Browser and goto QAbundle instance
Library           SeleniumLibrary
Library           DateTime
Resource          ../PageObjects/Generic.robot
Resource          ../PageObjects/TemplatePage.robot
Test Teardown    Close Browser

*** Variables ***
${row} 2
${column}  1
*** Test Cases ***
Template_Create
    [Tags]    Sanity
   ${username_designer}  ${password}=    Generic.Retrieve Username and Password   ${row}   ${column}

     Log    First Value: ${username_designer}

    Generic.Login To QA Instance    ${username_designer}   ${password}
    TemplatePage.select a form and saving it as template    6579aad77eb909f9083f87ee
    TemplatePage.Choose From Template
    TemplatePage.Search category
#   workflowSelectPage.select workflow and publish to client

