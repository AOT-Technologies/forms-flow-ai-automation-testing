
*** Settings ***
Documentation     Form BundlingRBAC.
Test Setup     Open chrome Browser and goto QAbundle instance
Library           SeleniumLibrary
Library           DateTime
Resource            ../PageObjects/Generic.robot
Resource            ../PageObjects/ReviewerPage.robot
Test Teardown    Close Browser

*** Variables ***
${Bundle_form}       Automation_bundle
*** Variables ***
${row}   5
${column}  1
*** Test Cases ***

TaskSearchByReviewer_listview
  ${username_reviewer}  ${password}=    Generic.Retrieve Username and Password   ${row}   ${column}

     Log    First Value: ${username_reviewer}

    Generic.Login To QA Instance    ${username_reviewer}   ${password}
   ReviewerPage.searchInListView









