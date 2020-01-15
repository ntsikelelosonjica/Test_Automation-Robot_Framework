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
Resource          ../Resources/RegisterResource.robot
Resource          ../Resources/SalesOrder.robot
Resource          ../Resources/GiftRegistryResource.robot

*** Variables ***
${MyAccountsDropdown}    css=body > header > div.profile-menu.js-header-component-desktop-profile-menu.state--loaded > div > div > div > div:nth-child(2) > div > a:nth-child(2) > span
${ViewAccountButton}    css=body > div.outer-container.js-outer-container.js-header-adjust.state--expand > section > div.inner-container.inner-container--content > div > div > div > div.pg-xs-12-12.pg-md-8-12.pg-lg-9-12.my-accounts > div.pg-container.pg-container--no-padding > div > div.pg-md-4-12.my-accounts__manage-account-btn > a > input
${PayAccountButton}    css=body > div.outer-container.js-outer-container.js-header-adjust.state--expand > section > div.main__container > div.main__content > div > div.user-account__content.js-component-account-card-content > div > div.user-account__controls.js-component-account-controls-container > a.user-account__control.user-account__control--primary.js-component-account-toggle
${CreditOrDebitCardButton}    css=body > div.outer-container.js-outer-container.js-header-adjust.state--expand > section > div.main__container > div.main__content > div > div.user-account__content.js-component-account-content > div > form > div:nth-child(6) > div:nth-child(1) > div
${EFTButton}      css=body > div.outer-container.js-outer-container.js-header-adjust.state--expand > section > div.main__container > div.main__content > div > div.user-account__content.js-component-account-content > div > form > div:nth-child(6) > div:nth-child(2) > div
${MakePaymentButoonDebitOrCreditCard}    id=account_payment_btn-card
${MakePaymentButtonEFT}    id=account_payment_btn-eft
${PayUiPayRadioButton}    css=body > div:nth-child(3) > div > div.col-lg-9.col-md-9.col-sm-12.col-xs-12 > div > div.toggle-group-item > div.toggle-text > label > input[type=radio]
${PayUCreditCardRadioButton}    css=body > div:nth-child(3) > div > div.col-lg-9.col-md-9.col-sm-12.col-xs-12 > div > div:nth-child(15) > div.toggle-text > label > input[type=radio]
${PayUCreditCardNumberField}    id=0_cardNumber
${PayUCreditCardHolderNameField}    id=0_nameOnCard
${PayUExpiryMonthDropDown}    id=0_expMonth
${PayUExpiryMonthOne}    xpath=//*[@id="0_expMonth"]/option[2]    #Jan
${PayUExpiryYearDropDown}    id=0_expYear
${PayUExpiryYear2020}    xpath=//*[@id="0_expYear"]/option[3]    #2020
${PayUCVVNumberField}    id=0_cvv
${PayUCVVNumberField2}    id=paymentMethodsCREDITCARD_TOKEN0.cvv
${PaySaveandPayCreditCardButton}    id=tokenSubmit
${PayUPayCreditCardButton}    id=tokenSubmit
${PayUContinueEFTButton}    css=#payuprofile > div > div > div > button
${PayUTestSuccessfulResponse}    css=body > a.btn.btn-success
${ViewTransactionsButton}    css=body > div.outer-container.js-outer-container.js-header-adjust.state--expand > section > div.main__container > div.main__content > div > div.user-account__content.js-component-account-content > div > form > div.user-account__history-filter.user-account__history-filter--controls > input

*** Keywords ***
My Accounts Page
    Click Element    ${MyAccountsDropdown}    #Clicking My Accounts in profile header dropdown
    Wait Until Page Contains    My Accounts    30s
    Capture Page Screenshot    MyAccountsPage-{index}.png

View An Account
    Click Element    ${ViewAccountButton}
    Wait Until Page Contains    My Accounts    30s
    Capture Page Screenshot    ViewAnAccount-{index}.png

Make Payment With Credit Card
    View An Account
    Sleep    3s
    Click Element    ${PayAccountButton}
    Click Element    ${CreditOrDebitCardButton}
    Sleep    2s
    Click Element    ${MakePaymentButoonDebitOrCreditCard}
    Wait Until Page Contains    TFG Account Payment: Ref    10s    #in PayU page
    Sleep    5s
    Comment    Click Button    ${PayUCreditCardRadioButton}
    #Sleep    3h    #added hours of sleep for debugging
    ${IsPayUCreditCardNumberFieldVisible}=    Run Keyword And Return Status    Element Should Be Visible    PayUCreditCardNumberField
    Run Keyword If    ${IsPayUCreditCardNumberFieldVisible}    Input Text    ${PayUCreditCardNumberField}    ${PayUCardNumber}    #PayUCardNumber from ECOM_Variables.robot
    ...    Input Text    ${PayUCreditCardHolderNameField}    ${PayUCardHolderName}    #//
    ...    Click Element    ${PayUExpiryMonthDropDown}
    ...    Click Element    ${PayUExpiryMonthOne}
    ...    Click Element    ${PayUExpiryYearDropDown}
    ...    Click Element    ${PayUExpiryYear2020}
    ...    Input Text    ${PayUCVVNumberField}    ${CVVNumber}    #CCNumber stored as a variable in the ECOM_Variables.robot file
    ...    Click Button    ${PayUSaveandPayCreditCardButton}
    ...    Comment    Wait Until Page Contains    \    30s
    ...    Wait Until Page Contains    A confirmation message will be sent to your TFG inbox    30s
    ...    Capture Page Screenshot    TFGAccountPaymentSuccessPageCreditCard-{index}.png
    ...    ELSE    Input Text    ${PayUCVVNumberField2}    ${CVVNumber}
    Click Button    ${PayUPayCreditCardButton}
    Wait Until Page Contains    A confirmation message will be sent to your TFG inbox    30s
    Capture Page Screenshot    TFGAccountPaymentSuccessPageCreditCard-{index}.png
    

Make Payment With EFT
    View An Account
    Sleep    3s
    Click Element    ${PayAccountButton}
    Click Element    ${EFTButton}
    Sleep    2s
    Click Element    ${MakePaymentButtonEFT}
    Wait Until Page Contains    TFG Account Payment: Ref    10s    #in PayU page
    Sleep    5s
    Click Button    ${PayUiPayRadioButton}
    Sleep    5s
    Click Button    ${PayUContinueEFTButton}
    Click Element    ${PayUTestSuccessfulResponse}
    Wait Until Page Contains    A confirmation message will be sent to your TFG inbox    30s
    Capture Page Screenshot    TFGAccountPaymentSuccessPAgeEFT-{index}.png

View Transactions
    View An Account
    Click Element    ${ViewTransactionsButton}
    Wait Until Page Contains    Customer has No Transactions    20
    Capture Page Screenshot    ViewTransactions-{index}.png
