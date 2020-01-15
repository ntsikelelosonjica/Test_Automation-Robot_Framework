*** Variables ***
${RegisterNewProfileButton}    css=body > div.outer-container.js-outer-container.js-header-adjust.state--expand > section > div.inner-container.inner-container--content > div > div > div.register-login__container.js-register-login > div.register-login__content > div:nth-child(6) > div
${RegisterWithoutCardButton}    css=body > div.outer-container.js-outer-container.js-header-adjust.state--expand > section > div.inner-container.inner-container--content > div > div > div.register-login__container.js-register-login > div.register-login__content > div.register-login__fieldset.register-login__fieldset--cta > div.register-login__fieldset-btn > div
${RegisterCardNumberField}    id=login__card-number
${FindMyCardButton}    xpath=//*[@id="tfg-card-number-form"]/fieldset[3]/div/input
${RegisterEmailAddressField}    id=contact-details__email
${RegisterPhoneNumberField}    id=contact-details__number
${RegisterButton}    xpath=//*[@id="contact-details-form"]/fieldset/div/input
${RegisterPasswordField}    id=create-profile__password
${RegisterConfirmPasswordField}    id=create-profile__confirm-pass
${RegisterMeButton}    xpath=//*[@id="create-profile-form"]/fieldset[5]/div/input
${SendOTPButton}    xpath=//*[@id="card-profile-otp-form"]/fieldset/div/input
${MaskedCellNoField}    xpath=/html/body/div[6]/section/div[3]/div/div/div[1]/div[2]/div[2]/p[1]
${OTPFieldRegister}    id=create-profile__otp
${NewPasswordField}    id=create-profile__otp-password
${ConfirmNewPasswordField}    id=create-profile__otp-confirm-pass
${RegisterMeButtonInOTPPage}    xpath=//*[@id="create-profile-otp-form"]/fieldset[7]/div/input
#-------Profile Details
${FirstNameField}    id=begc-registration-firstname
${LastNameField}    id=begc-registration-lastname
${CellNumberField}    id=begc-registration-cell-number
${EmailAddressField}    id=begc-registration-email
${CompanyNameField}    id=begc-registration-company
${VatRegistrationNumberField}    id=begc-registration-vat-number
${CompanyPhoneNumberField}    id=begc-registration-company-number
${CellNumberField}    id=begc-registration-cell-number
${CompanyStreetNumberField}    id=begc-registration-company-street-address
${SuburbField}    id=begc-registration-company-suburb
${City_TownField}    id=begc-registration-company-city
${Zip_PostalCodeField}    id=begc-registration-company-postal-code
${CountryFieldRegister}    xpath=//*[@id="nosui-form-select-begc-registration-company-country"]
${SelectCountryFieldRegister}    xpath=//*[@id="nosui-form-select-begc-registration-company-country"]/div[2]/div[2]    #//*[@id="begc-registration-company-country"]/option[2]
${SouthAfricaRegister}    xpath=//*[@id="nosui-form-select-begc-registration-company-country"]/div[2]/div[1]
${NamibiaRegister}    xpath=//*[@id="nosui-form-select-begc-registration-company-country"]/div[2]/div[2]
${ZambiaRegister}    xpath=//*[@id="nosui-form-select-begc-registration-company-country"]/div[2]/div[3]
@{CountriesRegister}    ${SouthAfricaRegister}    ${NamibiaRegister}    ${ZambiaRegister}
${AcceptCheckBoxCorporate}    xpath=//*[@id="begc-registration"]/div[2]/fieldset[13]/div/div/div
${RegisterForBeGCButtonCorporate}    xpath=//*[@id="begc-registration"]/div[2]/fieldset[14]/div/input
${AcceptCheckBoxStaff}    xpath=//*[@id="begc-registration"]/div[2]/fieldset[7]/div/div/div
${RegisterForBeGCButtonStaff}    xpath=//*[@id="begc-registration"]/div[2]/fieldset[8]/div/input
${TFGEmployeeNumberField}    id=begc-registration-employee-number
${DateOfBirthField}    id=begc-registration-birthday
@{EmployeeNumber}    1167478    1167155    #EmployeeNumber index should map with that of EmployeeDOB below
@{EmployeeDOB}    '12 05 95'    '01 08 91'    #EmployeeDOB indexes mapping to that of EmployeeNumber above

*** Keywords ***
Convert Masked Cell No To Text Register
    ${MaskedCellNoFieldToTextRegister}=    Get Text    ${MaskedCellNoField}
    Set Global Variable    ${MaskedCellNoFieldToTextRegister}

Register
    Register Or Login Page    #Using Register or Login Page from Common.robot
    Click Element    ${RegisterNewProfileButton}    #Register A New Profile Button
    Wait Until Page Contains    Let us find you    40s

Register Without a Card
    Click Element    ${RegisterWithoutCardButton}

Type Email Address to Register Without a Card
    Register Without a Card
    ${FakeEmail}=    Email
    Input Text    ${RegisterEmailAddressField}    ${FakeEmail}    #Typing Email Address
    Click Register Button after typing Email or Phone Number
    Sleep    5s
    Type Password Confirm and Click Register Me

Type Phone Number to Register Without a Card
    Register Without a Card
    ${FakeNumber}=    Cell No
    Input Text    ${RegisterPhoneNumberField}    ${FakeNumber}    #Typing Phone Number
    Click Register Button after typing Email or Phone Number
    Type Password Confirm and Click Register Me

Click Register Button after typing Email or Phone Number
    Click Element    ${RegisterButton}    #Clicking Register button

Type Password Confirm and Click Register Me
    Input Text    ${RegisterPasswordField}    ${password}    #Typing password
    Input Text    ${RegisterConfirmPasswordField}    ${password}    #Confirming password
    Click Button    ${RegisterMeButton}    #Clicking Register Me button
    Look for Accounts & Orders    #from BeGCCommonResource.robot
    Confirm Bulk eGift Card Registration Page    #from BeGCCommonResource.robot
    Capture Page Screenshot    BeGCRegisterationPage-{index}.png

Fill In Registration Information for Corporate when Registered with Email
    This is a Corporate Member    #Imported from BeGCCommonResource.robot
    ${FirstName}=    Color Name
    Input Text    ${FirstNameField}    ${FirstName}
    ${LastName}=    Color Name
    Input Text    ${LastNameField}    ${LastName}
    ${CellNumber}=    Cell No
    Input Text    ${CellNumberField}    ${CellNumber}
    ${CompanyName}=    Color Name
    Input Text    ${CompanyNameField}    ${CompanyName}
    ${VatRegistrationNumber}=    Generate Random String    12    [NUMBERS]
    Input Text    ${VatRegistrationNumberField}    ${VatRegistrationNumber}
    ${CompanyPhoneNumber_CellNumber}=    Cell No    #CompanyPhoneNumber for Corporate/ Cell Number for Staff
    Input Text    ${CompanyPhoneNumberField}    ${CompanyPhoneNumber_CellNumber}
    ${CompanyStreetNumber}=    Generate Random String    3    [NUMBERS]
    Input Text    ${CompanyStreetNumberField}    ${CompanyStreetNumber}
    ${Suburb}=    Color Name
    Input Text    ${SuburbField}    ${Suburb}
    ${City_Town}=    Color Name
    Input Text    ${City_TownField}    ${City_Town}
    ${Zip_PostalCode}=    Generate Random String    4    [NUMBERS]
    Input Text    ${Zip_PostalCodeField}    ${Zip_PostalCode}
    Click Element    ${CountryFieldRegister}
    Click Element    ${CountriesRegister[${0}]}
    Click Element    ${AcceptCheckBoxCorporate}
    Click Element    ${RegisterForBeGCButtonCorporate}
    Bulk eGift Card Registered    #Imported from BeGCCommonResource.robot

Fill In Registration Information for Staff when Registered with Email
    [Arguments]    ${index}
    #Set Global Variable    ${index}
    This is a Staff Member    #Imported from BeGCCommonResource.robot
    #${TempEmployeeNumber}=    Generate Random String    8    [NUMBERS]    #Commented on 22 March to use line/code below
    #Input Text    ${TFGEmployeeNumberField}    ${TempEmployeeNumber}    #Commented on 22 March to use line/code below
    Input Text    ${TFGEmployeeNumberField}    ${EmployeeNumber[${index}]}
    ${FirstName}=    Color Name
    Input Text    ${FirstNameField}    ${FirstName}
    ${LastName}=    Color Name
    Input Text    ${LastNameField}    ${LastName}
    ${TempDOB}=    Date    pattern=%d %b %Y
    Execute JavaScript    document.getElementById('begc-registration-birthday').removeAttribute("readonly")    #value='${TempDOB}'
    Input Text    ${DateOfBirthField}    ${EmployeeDOB[${index}]}
    ${CellNumber}=    Cell No
    Focus    ${CellNumberField}    # hide calendar control
    Input Text    ${CellNumberField}    ${CellNumber}
    Click Element    ${AcceptCheckBoxStaff}
    Click Element    ${RegisterForBeGCButtonStaff}
    Bulk eGift Card Registered    #Imported from BeGCCommonResource.robot

Fill In Registration Information for Corporate when Registered with CellNumber
    This is a Corporate Member    #Imported from BeGCCommonResource.robot
    ${FirstName}=    Color Name
    Input Text    ${FirstNameField}    ${FirstName}
    ${LastName}=    Color Name
    Input Text    ${LastNameField}    ${LastName}
    ${EmailAddress}=    Email
    Input Text    ${EmailAddressField}    ${EmailAddress}
    ${CompanyName}=    Color Name
    Input Text    ${CompanyNameField}    ${CompanyName}
    ${VatRegistrationNumber}=    Generate Random String    12    [NUMBERS]
    Input Text    ${VatRegistrationNumberField}    ${VatRegistrationNumber}
    ${CompanyPhoneNumber_CellNumber}=    Cell No    #CompanyPhoneNumber for Corporate/ Cell Number for Staff
    Input Text    ${CompanyPhoneNumberField}    ${CompanyPhoneNumber_CellNumber}
    ${CompanyStreetNumber}=    Generate Random String    3    [NUMBERS]
    Input Text    ${CompanyStreetNumberField}    ${CompanyStreetNumber}
    ${Suburb}=    Color Name
    Input Text    ${SuburbField}    ${Suburb}
    ${City_Town}=    Color Name
    Input Text    ${City_TownField}    ${City_Town}
    ${Zip_PostalCode}=    Generate Random String    4    [NUMBERS]
    Input Text    ${Zip_PostalCodeField}    ${Zip_PostalCode}
    Click Element    ${CountryFieldRegister}
    Click Element    ${CountriesRegister[${0}]}
    Click Element    ${AcceptCheckBoxCorporate}
    Click Element    ${RegisterForBeGCButtonCorporate}
    Bulk eGift Card Registered    #Imported from BeGCCommonResource.robot

Fill In Registration Information for Staff when Registered with CellNumber
    This is a Staff Member    #Imported from BeGCCommonResource.robot
    ${TempEmployeeNumber}=    Generate Random String    8    [NUMBERS]
    Input Text    ${TFGEmployeeNumberField}    ${TempEmployeeNumber}
    ${FirstName}=    Color Name
    Input Text    ${FirstNameField}    ${FirstName}
    ${LastName}=    Color Name
    Input Text    ${LastNameField}    ${LastName}
    ${TempDOB}=    Date    pattern=%d %b %Y
    Execute JavaScript    document.getElementById('begc-registration-birthday').removeAttribute("readonly")    #value='${TempDOB}'
    Input Text    ${DateOfBirthField}    ${TempDOB}
    ${EmailAddress}=    Email
    Focus    ${EmailAddressField}    # hide calendar control
    Input Text    ${EmailAddressField}    ${EmailAddress}
    Click Element    ${AcceptCheckBoxStaff}
    Click Element    ${RegisterForBeGCButtonStaff}
    Bulk eGift Card Registered    #Imported from BeGCCommonResource.robot

Register Corporate with Email
    Fill In Registration Information for Corporate when Registered with Email

Register Staff with Email
    Fill In Registration Information for Staff when Registered with Email    ${index}

Register Corporate with CellNumber
    Fill In Registration Information for Corporate when Registered with CellNumber

Register Staff with CellNumber
    Fill In Registration Information for Staff when Registered with CellNumber
