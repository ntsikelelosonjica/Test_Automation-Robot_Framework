*** Variables ***
${CloseCookieNotificationMyTFGWorld}    xpath=/html/body/div[10]/div/div[2]/i
${CloseCookieNotificationEcom}    xpath=/html/body/div[9]/div/div[2]/i
${NotTFGStaffMemberButton}    xpath=//*[@id="begc-registration"]/div[2]/fieldset[1]/div[2]/label[2]/div
${TFGStaffMemberButton}    xpath=//*[@id="begc-registration"]/div[2]/fieldset[1]/div[2]/label[1]/div
${MemberSubmitButton}    xpath=//*[@id="begc-registration"]/div[2]/fieldset[2]/div/input
${CardRadioButton}    name=pay_meth
${CreditCardNumberField}    id=0_cardNumber
${CreditCardHolderNameField}    id=0_nameOnCard
${ExpiryDateMonth}    id=0_expMonth
${ExpiryDateYear}    id=0_expYear
${ExpiryDateMonthOption1}    xpath=//*[@id="0_expMonth"]/option[2]
${ExpiryDateYearOption2020}    xpath=//*[@id="0_expYear"]/option[3]
${CVVNumberField}    id=0_cvv
${PayButton}    id=btnPay

*** Keywords ***
Register or Login Page
    open browser    about:blank    chrome    #opening browser generic
    Go To    ${BeGCSite}    #Opening the Browser using ${BeGCSite} variable from BeGC_Variables.robot
    Maximize Browser Window    #Maximazing the Browser Window
    Wait Until Page Contains    This website uses cookies    30s    #Waiting for the Cookie Notification
    ${IsCloseCookieNotificationMyTFGWorldVisibile}=    Run Keyword And Return Status    Element Should Be Visible    ${CloseCookieNotificationMyTFGWorld}
    Run Keyword If    ${IsCloseCookieNotificationMyTFGWorldVisibile}    Click Element    ${CloseCookieNotificationMyTFGWorld}    #Closing the Cookie Notification for MyTFG world
    ...    ELSE    Click Element    ${CloseCookieNotificationEcom}    #Closing the Cookie Notification for any of the Ecom Sites

Look for Accounts & Orders
    Wait Until Page Contains    Accounts & Orders    20s    #If Page does not contain Accounts & Orders in 1min then stop looking

Confirm Bulk eGift Card Registration Page
    Wait Until Page Contains    Bulk eGift Card Registration    5s

This is a Corporate Member
    Click Element    ${NotTFGStaffMemberButton}
    Click Element    ${MemberSubmitButton}

This is a Staff Member
    Click Element    ${TFGStaffMemberButton}
    Click Element    ${MemberSubmitButton}

Bulk eGift Card Registered
    Sleep    10s
    Wait Until Page Contains    Place an order for new bulk eGift Cards.    5s
    Capture Page Screenshot    UserRegisteredForBeGC-{index}.png

Complete Payment Credit Card
    Click Element    ${CardRadioButton}
    Input Text    ${CreditCardNumberField}    ${CrediCardNumber}
    Input Text    ${CreditCardHolderNameField}    ${CreditCardHolderName}
    Input Text    ${CVVNumberField}    ${CVVNUmber}
    Click Element    ${PayButton}
