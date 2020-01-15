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
Resource          ../Resources/AccountsResource.robot
Resource          ../Resources/GiftRegistryResource.robot

*** Variables ***
${OrdersDropdown}    xpath=/html/body/header/div[4]/div/div/div/div[3]/div/a[1]/span

*** Keywords ***
My Orders
    Click Elenent    ${OrdersDropdown}    #Clicking Orders in proifle header dropdown
    Wait Until Page Contains    ORDERS    30s
    Capture Page Screenshot    MyOrders-{index}.png

Add To Bag
    Sleep    10s
    Click Element    ${HomeCarousel}    #DuesouthEscapes
    Capture Page Screenshot    Site-{index}.png
    Sleep    10s
    Click Element    ${MarkhamCarousel}    #DuesouthEscapes
    Capture Page Screenshot    Site-{index}.png
    Sleep    10s
    Click Element    ${DonnaCarousel}    #DuesouthEscapes
    Capture Page Screenshot    Site-{index}.png
    Sleep    10s
    Click Element    ${FabianiCarousel}    #DuesouthEscapes
    Capture Page Screenshot    Site-{index}.png
    Sleep    10s
    Click Element    ${DuesouthEscapesCarousel}    #DuesouthEscapes
    Capture Page Screenshot    Site-{index}.png
    Sleep    10s
    Click Element    ${FoschiniCarousel}    #DuesouthEscapes
    Capture Page Screenshot    Site-{index}.png
    Sleep    10s
