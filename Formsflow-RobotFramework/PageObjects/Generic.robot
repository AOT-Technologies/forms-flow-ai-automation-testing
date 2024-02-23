*** Settings ***

Documentation     A resource file with reusable keywords and variables.
...
...               The system specific keywords created here form our own
...               domain specific language. They utilize keywords provided
...               by the imported SeleniumLibrary.

Library           SeleniumLibrary
Library    ExcelLibrary
Library    RPA.Excel.Files
*** Variables ***

${url}                   https://forms-flow-web-qaee.aot-technologies.com/
${enter_username}        //*[@id="username"]
${enter_password}        //*[@id="password"]
${login}                 //*[@id="kc-login"]
#${designer_user}         formsflow-designer
#${client_user}           formsflow-client
#${browser_name}          Chrome
#${reviewer_user}         formsflow-reviewer
#${admin_user}            john.honai
#${test_reviewer}         test-reviewer
#${password}              aot123
*** Variables ***
${Excel_FILE}     D:\\updated_develop\\forms-flow-ai-automation-testing\\Formsflow-RobotFramework\\PageObjects\\Resource\\Datasheet.xlsx

*** Keywords ***
Retrieve Username and Password
    # Open Excel file
   [Arguments]    ${row}   ${column}
    Open Workbook      ${Excel_FILE}
    ${username}=   Get Cell Value     ${row}   ${column}
    ${password}=    Get Cell Value     2    2
    Log    Value from second row, first column: ${username}
   Log    Value from second row, second column: ${password}

    [Return]    ${username}   ${password}
    Close Workbook



Open chrome Browser and goto QAbundle instance

     Open Browser       ${url}        browser=chrome    options=add_argument("--headless")
     #Open Browser       ${url}        ${browser_name}
     Maximize Browser Window

Login To QA Instance
	  sleep                             5
	  [Arguments]                      ${username}   ${password}
      Input Text                       ${enter_username}     ${username}
      Input Password                   ${enter_password}     ${password}
      Click Button                     ${login}
      Maximize Browser Window
      sleep                             5

Close Browser session
    Close Browser

Wait Until element passed is located on Page
    [arguments]                         ${page_locator}
    Wait Until Element Is Visible       ${page_locator}        timeout=10

validate success message after form create
	${response}=    Get Text            xpath=//div[contains(text(),'Form-Workflow association saved.')]
    Should Be Equal As Strings          ${response}    Form-Workflow association saved.

logout

      sleep   20
      ${toast_is_displayed}=  Run Keyword And Return Status   Page Should Contain Element    //div[@class='Toastify__toast Toastify__toast--success']
     Log   ${toast_is_displayed}
    Run Keyword If   ${toast_is_displayed}==True    Click Element    xpath=//div[@role='alert']
#    Click Element    xpath=//div[@role='alert']
#         Wait Until Page Does Not Contain Element     //div[contains(text(),'Form-Workflow association saved.')]     timeout=50s
    sleep    40
              Click Element    //span[@class='navbar-toggler-icon']

	Click Element            //div[@class='nav-item dropdown']/a[@class='dropdown-toggle nav-link']
    Click Element            //a[normalize-space()='Logout']
