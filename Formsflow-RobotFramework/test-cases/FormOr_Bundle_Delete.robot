*** Settings ***
Documentation        New Form Creation.
Test Setup           Open chrome Browser and goto QAbundle instance
Library             SeleniumLibrary
Resource            ../PageObjects/FormOrBundleDelete.robot
Resource            ../PageObjects/Generic.robot

*** Test Cases ***
Repeat My Test Case
    Repeat Test    3
    
Deleting a Form
    [Tags]    Sanity
    Generic.Login To QA Instance   ${designer_user}
    #FormOrBundleDelete.Delete a form
    FormOrBundleDelete.Delete a Bundle
    Generic.logout
