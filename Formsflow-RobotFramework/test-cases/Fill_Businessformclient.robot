
*** Settings ***
Documentation    Fill Business form as client.
Library           SeleniumLibrary
Library           DateTime

Test Setup      Open chrome Browser and goto QAbundle instance

Resource            ../PageObjects/FormsLandingPAge.robot
Resource            ../PageObjects/FormfillClient.robot
Resource            ../PageObjects/Generic.robot
Resource            ../PageObjects/ApplicationPage.robot

Suite Teardown    Close Browser

*** Variables ***
${New_businessform}       New Business License
${formname_freedom}       freedom
${form_id}                64b8dd187b3d9f92a25474ca
${row}  3
${column}    1
*** Test Cases ***
Logintest
	 ${client_user}  ${password}=    Generic.Retrieve Username and Password   ${row}   ${column}

     Log    First Value: ${client_user}
  Generic.Login To QA Instance   ${client_user}    ${password}
  FormsLandingPAge.Search Form     ${New_businessform}     ${form_id}
  FormfillClient.Fill_Form
  Applicationpage.Check status of form submitted

