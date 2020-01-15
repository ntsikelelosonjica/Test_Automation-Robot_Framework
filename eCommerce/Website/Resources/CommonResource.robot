*** Settings ***
Library           SeleniumLibrary    # importing the ExtendedSelenium2Library
Library           FakerLibrary    # importing fakerlibrary to create fake test data
Library           String
Library           DatabaseLibrary
Library           ../Libraries/testcellphone.py
Resource          ../Resources/SignInResource.robot    #importing the RegisterResource.robot resource file to use keywords in file
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
${ProfileHeaderIcon}    css=#header-content > div > div > div > a:nth-child(2) > div > span.header__control-copy.header__control-copy--alt
${CloseNewsLetterPopupEcom}    xpath=/html/body/div[10]/div/div/div/div[1]/div/span[1]
${CloseNewsLetterPopupMyTFGWorld}    css=body > div.modal-bg-cover.animate-in > div > div > div > div.newsletter-modal__close-container > div > span.newsletter-modal__close
${CloseCookieNotificationEcom}    css=body > div.cookie-notification.is--visible.js-tfg-view.js-tfg-view-cookie-notification > div > div.cookie-notification__close.js-cookie-notification-close > i    # xpath=/html/body/div[9]/div/div[2]/i
${CloseCookieNotificationMyTFGWorld}    xpath=/html/body/div[10]/div/div[2]/i

*** Keywords ***
Home Page
    [Arguments]    ${index}
    open browser    about:blank    @{browsers}[${index}]    #opening browser generic
    Go To    @{sites}[${index}]    #Opening the Browser using ${mytfguat} variable from ECOM_Variables.robot
    Maximize Browser Window

Register or Login Page
    Home Page    ${index}    #Making use of the Home Page
    Profile Icon in Header    #Using Profile Icon in Header user defined keyword
    Wait Until Page Contains    How would you like to sign in?    40s

Look for Accounts & Orders
    Wait Until Page Contains    Accounts & Orders    1min    #If Page does not contain Accounts & Orders in 1min then stop looking : Validation step that the test case passes
    Sleep    5s

Profile Icon in Header
    Click Element    ${ProfileHeaderIcon}    #Clicking the Profile Icon Header
    Sleep    2s

Close Cookie Notification
    Click Element    ${CloseCookieNotificationEcom}    #Closing the Cookie Notification for any of the Ecom Sites    # ${IsCloseCookieNotificationMyTFGWorldVisibile}=    Run Keyword And Return Status    Element Should Be Visible    ${CloseCookieNotificationMyTFGWorld}

Setting Up the index Variable
    ${index}=    Set Variable    ${0}
    Set Global Variable    ${index}
