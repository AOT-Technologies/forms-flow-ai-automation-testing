
*** Settings ***
Documentation    Fill Business form as client.
Library           SeleniumLibrary
Library           DateTime

Test Setup      Open chrome Browser and goto QAbundle instance

Resource            ../PageObejcts/FormsLandingPAge.robot
Resource            ../PageObejcts/FormfillClient.robot
Resource            ../PageObejcts/Generic.robot
Resource            ../PageObejcts/ApplicationPage.robot

Test Teardown       Close Browser

*** Variables ***
${formname_client}       New Business
${formname_freedom}     freedom
*** Test Cases ***
Logintest
  Generic.LoginToApplication_client
  FormsLandingPAge.Search Form     ${formname_client}
  FormfillClient.Fill_Form
   Applicationpage.Check status of form submitted

