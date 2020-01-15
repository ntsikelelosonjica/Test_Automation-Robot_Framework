*** Settings ***
Library           SeleniumLibrary    # importing the ExtendedSelenium2Library
Library           FakerLibrary    # importing fakerlibrary to create fake test data
Library           String
Library           DatabaseLibrary
Library           ../Libraries/testcellphone.py
Resource          ../Resources/SignInResource.robot    #importing the RegisterResource.robot resource file to use keywords in file
Resource          ../Resources/CommonResource.robot
Resource          ../Resources/ProfileHeaderResource.robot
Resource          ../Resources/MyProfileResource.robot
Resource          ../Resources/MyAddressResource.robot
Resource          ../Resources/LinkResource.robot
Resource          ../Resources/ECOM_Variables.robot
Resource          ../Resources/SalesOrder.robot
Resource          ../Resources/AccountsResource.robot
Resource          ../Resources/GiftRegistryResource.robot

*** Variables ***
${RegisterNewProfileButton}    css=body > div.outer-container.js-outer-container.js-header-adjust.state--expand > section > div.inner-container.inner-container--content > div > div > div.register-login__container.js-register-login > div.register-login__content > div:nth-child(6) > div    # xpath=/html/body/div[6]/section/div[3]/div/div/div[1]/div[2]/div[5]/div
${RegisterWithoutCardButton}    xpath=//div[@class="btn-primary btn--full js-continue-without-card"]
${CardNumberFieldRegister}    id=login__card-number
${FindMyCardButton}    xpath=//*[@id="tfg-card-number-form"]/fieldset[3]/div/input
${RegisterEmailAddressField}    id=contact-details__email
${RegisterPhoneNumberField}    id=contact-details__number
${RegisterButton}    xpath=//*[@id="contact-details-form"]/fieldset/div/input
${RegisterPasswordField}    id=create-profile__password
${RegisterConfirmPasswordField}    id=create-profile__confirm-pass
${RegisterMeButton}    xpath=//*[@id="create-profile-form"]/fieldset[5]/div/input
${SendOTPButton}    xpath=//*[@id="card-profile-otp-form"]/fieldset/div/input
${MaskedCellNoField}    css=#resend-otp-form > div > div > div:nth-child(1) > label > span    # xpath=/html/body/div[6]/section/div[3]/div/div/div[1]/div[2]/div[2]/p[1]
${OTPFieldRegister}    id=create-profile__otp
${NewPasswordField}    id=create-profile__otp-password
${ConfirmNewPasswordField}    id=create-profile__otp-confirm-pass
${RegisterMeButtonInOTPPage}    xpath=//*[@id="create-profile-otp-form"]/fieldset[7]/div/input

*** Keywords ***
Convert Masked Cell No To Text Register
    ${MaskedCellNoFieldToTextRegister}=    Get Text    ${MaskedCellNoField}
    Set Global Variable    ${MaskedCellNoFieldToTextRegister}

Connect To DB and Complete Registration
    sleep    10s
    Connect To DataBase Using Custom Params    pymssql    host='10.18.101.83', database='OmniChannelLogDb'
    ${OTP}=    Query    select top 1 (Pin) from OneTimePin where MaskedCellNumber in ('${MaskedCellNoFieldToTextRegister}') order by DateCreated desc
    Input Text    ${OTPFieldRegister}    ${OTP[0][0]}
    Input Text    ${NewPasswordField}    ${password}
    Input Text    ${ConfirmNewPasswordField}    ${password}
    Click Element    ${RegisterMeButtonInOTPPage}
    Look for Accounts & Orders
    Capture Page Screenshot    UserRegisteredWithCard-{index}.png

Register
    Register or Login Page    #Using Register or Login Page from Common.robot
    Wait Until Page Contains    This website uses cookies
    Close Cookie Notification
    click element    ${RegisterNewProfileButton}    #Register A New Profile Button
    Wait Until Page Contains    Let us find you    40s

Register With a Card
    [Arguments]    ${index}
    Input Text    ${CardNumberFieldRegister}    ${RegCardNumberAll[${index}]}    #Using Card number from ECOM_Variables.robot
    Click Element    ${FindMyCardButton}
    Sleep    10s
    Wait Until Page Contains    No online profile found    30s
    Click Element    ${SendOTPButton}
    Wait Until Page Contains    Register your online profile
    #Sleep    20s
    Comment    Capture Page Screenshot    NoOnlineProfileFound-{index}.png

Register Without a Card
    Click Element    ${RegisterWithoutCardButton}

Type Email Address to Register Without a Card
    Register Without a Card
    ${FakeEmail}=    Email
    Set Global Variable    ${FakeEmail}
    Input Text    ${RegisterEmailAddressField}    ${FakeEmail}    #Typing Email Address
    Click Register Button after typing Email or Phone Number
    Type Password Confirm and Click Register Me

Type Phone Number to Register Without a Card
    Register Without a Card
    Comment    ${FakeNumber}=    Cell No
    ${FakeNumber}=    Generate Random String    7    [NUMBERS]
    ${FakeNumber}=    Catenate    SEPARATOR=    071    ${FakeNumber}
    Input Text    ${RegisterPhoneNumberField}    ${FakeNumber}    #Typing Phone Number
    Click Register Button after typing Email or Phone Number
    Type Password Confirm and Click Register Me

Click Register Button after typing Email or Phone Number
    Click Element    ${RegisterButton}    #Clicking Register button
    Sleep    4s    #Without this delay the test case fails because it usually takes time to get to the password screen

Type Password Confirm and Click Register Me
    Input Text    ${RegisterPasswordField}    ${password}    #Typing password
    Input Text    ${RegisterConfirmPasswordField}    ${password}    #Confirming password
    Click Button    ${RegisterMeButton}    #Clicking Register Me button
    Look for Accounts & Orders
    Capture Page Screenshot    UserRegisteredWithoutCard-{index}.png
