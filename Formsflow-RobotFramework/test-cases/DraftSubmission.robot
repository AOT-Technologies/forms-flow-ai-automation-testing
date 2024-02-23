*** Settings ***
Documentation     Form BundlingRBAC.
Test Setup     Open chrome Browser and goto QAbundle instance
Library           SeleniumLibrary
Resource            ../PageObjects/Generic.robot
Resource            ../PageObjects/FormsLandingPAge.robot

Resource            ../PageObjects/DraftPage.robot

Test Teardown    Close Browser

*** Variables ***
${search}       Automation Draft test
${form_id}      65828aa77eb909f9083f8fb4
${row}  3
${column}    1
*** Test Cases ***

New Draft
	 ${client_user}  ${password}=    Generic.Retrieve Username and Password   ${row}   ${column}

     Log    First Value: ${client_user}
    Generic.Login To QA Instance     ${client_user}   ${password}
    FormsLandingPAge.Search Form     ${search}   ${form_id}
    DraftPage.Create New draft
    DraftPage.Check for created Draft
    DraftPage.Draft Details
    DraftPage.Edit Draft
    DraftPage.Verify Form Field Component
#   DraftPage.Delete draft

Draft Filters
	[Tags]    sanity
    ${client_user}  ${password}=    Generic.Retrieve Username and Password   ${row}   ${column}

     Log    First Value: ${client_user}
    Generic.Login To QA Instance     ${client_user}   ${password}
    DraftPage.Check for created Draft
    DraftPage.Filter with draftName
    DraftPage.Filter with Modified Date
    DraftPage.Filter with Invalid draftName and draft Id