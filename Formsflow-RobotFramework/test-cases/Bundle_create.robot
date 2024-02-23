
*** Settings ***
Documentation     Form BundlingRBAC.
Test Setup     Open chrome Browser and goto QAbundle instance
Library           SeleniumLibrary
#Library    ExcelLibrary    openpyxl

Library    OperatingSystem
Library    ExcelLibrary
Library    RPA.Tables
Library    RPA.Excel.Files
Library    BuiltIn
Library  String

Library           DateTime
Resource            ../PageObjects/BundleCreatePAge.robot
Resource            ../PageObjects/Generic.robot
Resource            ../PageObjects/FormsLandingPAge.robot
Resource            ../PageObjects/FormfillClient.robot
Resource            ../PageObjects/ReviewerPage.robot
Resource            ../PageObjects/ApplicationPage.robot

Resource            ../PageObjects/workflowSelectPage.robot

Test Teardown    Close Browser

*** Variables ***

${Bundle_form}       Automation_bundle
${row}   2
${column}   1
${row_client}   3
${column_client} 1
${row_reviewer}   4
${column_reviewer} 1
*** Test Cases ***

Bundle_Create
    [Tags]    BundleCreate
    ${username_designer}  ${password}=    Generic.Retrieve Username and Password   ${row}   ${column}

     Log    First Value: ${username_designer}

    Generic.Login To QA Instance    ${username_designer}   ${password}
    BundleCreatePAge.CreateBundle
    workflowSelectPage.select bundle workflow and publish to client
    Generic.validate success message after form create
    Generic.logout

Bundle_FormfillByClient
   [Tags]    Fillform
   ${client_user}  ${password}=    Generic.Retrieve Username and Password   ${row_client}   ${column_client}

     Log    First Value: ${client_user}
  Generic.Login To QA Instance   ${client_user}    ${password}

  FormsLandingPAge.Search Bundle_Form   ${Bundle_form}
  FormfillClient.Fill_BundleForm
  FormfillClient.check second bundle form displayed
  FormfillClient.Fill_Freedomform
  Applicationpage.Check status of form submitted
  Generic.logout


Bundle_TaskActionByReviewer
  [Tags]    ReviewerAction
  ${reviewer_user}  ${password}=    Generic.Retrieve Username and Password   ${row_reviewer}   ${column_reviewer}

     Log    First Value: ${reviewer_user}
  Generic.Login To QA Instance   ${reviewer_user}    ${password}
  ReviewerPage.ReviewerAction
  Applicationpage.Check status of form submitted

BundlingRBAC_negative

	[Tags]    Sanity
    ${username_designer}  ${password}=    Generic.Retrieve Username and Password   ${row}   ${column}

     Log    First Value: ${username_designer}

    Generic.Login To QA Instance    ${username_designer}   ${password}
    BundleCreatePAge.Verify negative flow-enter same bundle name created earlier






