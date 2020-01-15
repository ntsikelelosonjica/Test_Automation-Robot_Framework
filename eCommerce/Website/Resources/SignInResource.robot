*** Settings ***
Library           SeleniumLibrary    # importing the ExtendedSelenium2Library
Library           FakerLibrary    # importing fakerlibrary to create fake test data
Library           String
Library           DatabaseLibrary
Library           ../Libraries/testcellphone.py
Resource          ../Resources/CommonResource.robot
Resource          ../Resources/ProfileHeaderResource.robot
Resource          ../Resources/MyProfileResource.robot
Resource          ../Resources/MyAddressResource.robot
Resource          ../Resources/LinkResource.robot
Resource          ../Resources/ECOM_Variables.robot
Resource          ../Resources/RegisterResource.robot
Resource          ../Resources/SalesOrder.robot
Resource          ../Resources/AccountsResource.robot
Resource          ../Resources/GiftRegistryResource.robot

*** Variables ***
${SignInSignInButton1}    css=body > div.outer-container.js-outer-container.js-header-adjust.state--expand > section > div.inner-container.inner-container--content > div > div > div.register-login__container.js-register-login > div.register-login__content > div:nth-child(3) > div
${SignInEmailAddressField}    id=login__email
${SignInPhoneNumberField}    id=login__number
${SignInPasswordField}    id=login__pass
${SignInSignInButton2}    css=#tfg-sign-in-form > fieldset.fieldset.fieldset--grid > div > input
#@{SignIn}        css=body > div.outer-container.js-outer-container.js-header-adjust.state--expand > section > div.inner-container.inner-container--content > div > div > div.register-login__container.js-register-login > div.register-login__content > div:nth-child(3) > div    id=login__email    id=login__number    id=login__pass    css=#tfg-sign-in-form > fieldset.fieldset.fieldset--grid > div > input    # SignInSignInButton1,SignInEmailAddressField,SignInPhoneNumberField,SignInPasswordField,SignInSignInButton2

*** Keywords ***
Sign In
    Register Or Login Page    #Using Register Or Login Page from CommonResource.robot
    Wait Until Page Contains    This website uses cookies    30s
    Close Cookie Notification
    click element    ${SignInSignInButton1}    #Sign In With Your Online Profile button

Type Existing Email Address to Sign In with Correct Password
    [Arguments]    ${index}
    Input Text    ${SignInEmailAddressField}    @{SignInEmailAll}[${index}]
    Type Correct Password and Click Sign In For Correct Details    #Using Type Password and Click Sign In user defined keyword from SignInResources.robot

Type Existing Email Address to Sign In with Incorrect Password
    [Arguments]    ${index}
    Input Text    ${SignInEmailAddressField}    @{SignInEmailAll}[${index}]
    Type Incorrect Password and Click Sign In    #Using Type Password and Click Sign In user defined keyword from SignInResources.robot

Type Fake Email Address to Sign In
    ${Fake_Email}=    EMAIL
    Input Text    ${SignInEmailAddressField}    ${Fake_Email}
    Type Correct Password and Click Sign In For Incorrect Email    #Using Type Password and Click Sign In user defined keyword from SignInResources.robot

Type Existing Phone Number to Sign In
    [Arguments]    ${index}
    Input Text    ${SignInPhoneNumberField}    @{SignInPhoneAll}[${index}]    #Typing Phone Number
    Type Correct Password and Click Sign In For Correct Details    #Using Type Password and Click Sign In user defined keyword from SignInResources.robot

Type Fake Phone Number to Sign In
    ${Fake_Number}=    Cell No
    Input Text    ${SignInPhoneNumberField}    ${Fake_Number}    #Typing Phone Number
    Type Correct Password and Click Sign In For Incorrect Phone    #Using Type Password and Click Sign In user defined keyword from SignInResources.robot

Type Correct Password and Click Sign In For Correct Details
    Input Password    ${SignInPasswordField}    ${password}    #Typing Password using ${password} from ECOM_Variables.robot
    Click Element    ${SignInSignInButton2}    #Clicking Sign In button
    Look for Accounts & Orders    #Using Look for Accounts & Orders user defined keyword from CommonResource.robot
    Capture Page Screenshot    UserLoggedIn-{index}.png    #Screenshot for proof of validation

Type Correct Password and Click Sign In For Incorrect Email
    Input Password    ${SignInPasswordField}    ${password}    #Typing Password using ${password} from ECOM_Variables.robot
    Click Element    ${SignInSignInButton2}    #Clicking Sign In button
    Wait Until Page Contains    The email address you've supplied is not linked to any of our registered users. Please can you try again.
    Capture Page Screenshot    LoginErrorMessageForIncorrectEmail-{index}.png    #Screenshot for proof of validation

Type Correct Password and Click Sign In For Incorrect Phone
    Input Password    ${SignInPasswordField}    ${password}    #Typing Password using ${password} from ECOM_Variables.robot
    Click Element    ${SignInSignInButton2}    #Clicking Sign In button
    Wait Until Page Contains    Incorrect number supplied. Please try again or call our contact centre for assistance.
    Capture Page Screenshot    LoginErrorMessageForIncorrectPhone-{index}.png    #Screenshot for proof of validation

Type Incorrect Password and Click Sign In
    Input Password    ${SignInPasswordField}    ${incorrectpassword}    #Typing Password using ${incorrectpassword} from ECOM_Variables.robot
    Click Element    ${SignInSignInButton2}    #Clicking Sign In button
    Wait Until Page Contains    Oh dear, the password that you've supplied is not valid. Please try again. Password to be 8 or more characters, can be case sensitive and include letters or numbers.
    Capture Page Screenshot    LoginErrorMessageForIncorrectPassword-{index}.png    #Screenshot for proof of validation
