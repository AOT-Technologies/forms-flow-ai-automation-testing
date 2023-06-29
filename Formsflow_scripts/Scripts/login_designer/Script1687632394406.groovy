import static com.kms.katalon.core.checkpoint.CheckpointFactory.findCheckpoint
import static com.kms.katalon.core.testcase.TestCaseFactory.findTestCase
import static com.kms.katalon.core.testdata.TestDataFactory.findTestData
import static com.kms.katalon.core.testobject.ObjectRepository.findTestObject
import static com.kms.katalon.core.testobject.ObjectRepository.findWindowsObject
import com.kms.katalon.core.checkpoint.Checkpoint as Checkpoint
import com.kms.katalon.core.cucumber.keyword.CucumberBuiltinKeywords as CucumberKW
import com.kms.katalon.core.mobile.keyword.MobileBuiltInKeywords as Mobile
import com.kms.katalon.core.model.FailureHandling as FailureHandling
import com.kms.katalon.core.testcase.TestCase as TestCase
import com.kms.katalon.core.testdata.TestData as TestData
import com.kms.katalon.core.testng.keyword.TestNGBuiltinKeywords as TestNGKW
import com.kms.katalon.core.testobject.TestObject as TestObject
import com.kms.katalon.core.webservice.keyword.WSBuiltInKeywords as WS
import com.kms.katalon.core.webui.keyword.WebUiBuiltInKeywords as WebUI
import com.kms.katalon.core.windows.keyword.WindowsBuiltinKeywords as Windows
import internal.GlobalVariable as GlobalVariable
import org.openqa.selenium.Keys as Keys

WebUI.openBrowser('')

WebUI.navigateToUrl(GlobalVariable.mf)

WebUI.maximizeWindow()

WebUI.setText(findTestObject('Object Repository/Page_Log in to forms-flow-ai-app3/input_Username or email_username'), findTestData(
        'login').getValue(1, 3))

WebUI.setEncryptedText(findTestObject('Object Repository/Page_Log in to forms-flow-ai-app3/input_Password_password'), findTestData(
        'login').getValue(2, 3))

WebUI.click(findTestObject('Object Repository/Page_Log in to forms-flow-ai-app3/input_Password_login'))

'Verify Logged in user\'s name'
WebUI.verifyElementText(findTestObject('Business_Licence/users_name'), findTestData('login').getValue(3, 3))

WebUI.verifyElementNotPresent(findTestObject('Business_Licence/Tasks'), 0)

WebUI.verifyElementNotPresent(findTestObject('Business_Licence/Dashboard'), 0)

WebUI.verifyElementPresent(findTestObject('General tests/a_Processes_tab'), 0)
