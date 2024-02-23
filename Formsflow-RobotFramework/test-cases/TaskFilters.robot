*** Settings ***
Documentation       This test case is for checking taskfilters updates.
Test Setup          Open chrome Browser and goto QAbundle instance
Library             SeleniumLibrary
Resource            ../PageObjects/TaskFilterCreate.robot

Resource            ../PageObjects/Generic.robot
Test Teardown    Close Browser

*** Variables ***
${row}   5
${column}  1
*** Test Cases ***

Task filters cases
	 ${username_reviewer}  ${password}=    Generic.Retrieve Username and Password   ${row}   ${column}

     Log    First Value: ${username_reviewer}

    Generic.Login To QA Instance    ${username_reviewer}   ${password}
    TaskFilterCreate.Check for taskfilters in the list
    TaskFilterCreate.Create new Taskfilter
