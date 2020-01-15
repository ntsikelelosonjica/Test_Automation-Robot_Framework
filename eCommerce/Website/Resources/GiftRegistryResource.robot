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
Resource          ../Resources/AccountsResource.robot
Library           SeleniumLibrary    # importing the ExtendedSelenium2Library
Library           FakerLibrary    # importing fakerlibrary to create fake test data
Library           String
Library           DatabaseLibrary
Library           ../Libraries/testcellphone.py

*** Variables ***
${GiftRegistryDropDown}    css=body > header > div.profile-menu.js-header-component-desktop-profile-menu.state--loaded > div > div > div > div:nth-child(3) > div > a:nth-child(4) > span    # xpath=/html/body/header/div[4]/div/div/div/div[3]/div/a[5]/span
${AddNewButton}    css=body > div.outer-container.js-outer-container.js-header-adjust.state--expand > section > div.inner-container.inner-container--content > div > div > div > div.pg-xs-12-12.pg-md-8-12.pg-lg-9-12 > div.phable > div.l-row-md > a
${NameField}      id=registry-name
${EventDropDown}    css=#nosui-form-select-event > div.nosui-form-select__placeholder
${WeddingEvent}    css=#nosui-form-select-event > div.nosui-form-select__list > div:nth-child(2)
${MessageField}    id=message
${Host1Field}     id=person-1
${Email1Field}    id=email-1
${DeliverToDropDown}    css=#nosui-form-select-ship-to > div.nosui-form-select__placeholder
${DeliverToAddress1}    css=#nosui-form-select-ship-to > div.nosui-form-select__list > div:nth-child(2)
${DateDateField}    id=data
${DeliverDateField}    id=ship-date
@{DeliverDates}    'Fri Mar 27 2020'    'Tue May 05 2020'    #EmployeeDOB indexes mapping to that of EmployeeNumber above
${MessageToCourierField}    id=registry-delivery-instruction
${SaveButton}     css=#giftRegistery > fieldset:nth-child(22) > div > input.btn-primary.btn--full-em-mobile

*** Keywords ***
Gift Registry
    Click Element    ${GiftRegistryDropDown}    #Clicking Gift Registry in profile dropdown for My_TFG_World    #Clicking Wish List in profile dropdown for any of the Ecom_Site
    Wait Until Page Contains    MY GIFT REGISTRIES    30s
    Capture Page Screenshot    GiftRegistry-{index}.png

Add New Gift Registry
    Gift Registry    #Using Gift Registry user defined keyword to land on the Gidt Registry page
    Click Element    ${AddNewButton}
    Wait Until Page Contains    CREATE YOUR GIFT REGISTRY    5s
    ${FakeName}=    Set Variable    NtsikeleloSo GiftRegistry
    Input Text    ${NameField}    ${FakeName}
    Click Element    ${EventDropDown}
    Click Element    ${WeddingEvent}
    Execute JavaScript    document.getElementById('data').removeAttribute("readonly")
    Input Text    ${DateDateField}    @{DeliverDates}[0]
    SET FOCUS TO ELEMENT    ${MessageField}
    Input Text    ${MessageField}    Yippeee issa wedding!!!
    ${FakeNameHost1}=    Name
    Input Text    ${Host1Field}    ${FakeNameHost1}
    ${FakeEmail1GiftRegistry}=    Email
    Input Text    ${Email1Field}    ${FakeEmail1GiftRegistry}
    Click Element    ${DeliverToDropDown}
    Click Element    ${DeliverToAddress1}
    Execute JavaScript    document.getElementById('ship-date').removeAttribute("readonly")
    Input Text    ${DeliverDateField}    @{DeliverDates}[1]
    SET FOCUS TO ELEMENT    ${MessageToCourierField}
    Input Text    ${MessageToCourierField}    You can call me on 0746980251
    Click Element    ${SaveButton}
    Wait Until Page Contains    Gift Registry Created Successfully    5s
    Capture Page Screenshot    GiftRegistryNewAdded-{index}.png
