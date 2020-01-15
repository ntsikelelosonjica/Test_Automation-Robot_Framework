*** Settings ***
Library           SeleniumLibrary    # importing the ExtendedSelenium2Library
Library           FakerLibrary    # importing fakerlibrary to create fake test data
Library           String
Library           DatabaseLibrary
Library           ../Libraries/testcellphone.py
Resource          ../Resources/SignInResource.robot    #importing the RegisterResource.robot resource file to use keywords in file
Resource          ../Resources/CommonResource.robot
Resource          ../Resources/MyProfileResource.robot
Resource          ../Resources/MyAddressResource.robot
Resource          ../Resources/LinkResource.robot
Resource          ../Resources/ECOM_Variables.robot
Resource          ../Resources/RegisterResource.robot
Resource          ../Resources/SalesOrder.robot
Resource          ../Resources/AccountsResource.robot
Resource          ../Resources/GiftRegistryResource.robot

*** Settings ***
Library           SeleniumLibrary    # importing the ExtendedSelenium2Library
Library           FakerLibrary    # importing fakerlibrary to create fake test data
Library           String
Library           DatabaseLibrary
Library           ../Libraries/testcellphone.py

*** Variables ***
${SignOutDropdown}    css=body > header > div.profile-menu.js-header-component-desktop-profile-menu.state--loaded > div > div > div > div:nth-child(2) > div > a:nth-child(4) > span
${MyTfgRewardsDropdown}    css=body > header > div.profile-menu.js-header-component-desktop-profile-menu.state--loaded > div > div > div > div:nth-child(3) > div > a:nth-child(2) > span
${MyWishListDropDown}    css=body > header > div.profile-menu.js-header-component-desktop-profile-menu.state--loaded > div > div > div > div:nth-child(3) > div > a:nth-child(3) > span
${MyReferralsDropdown}    css=body > header > div.profile-menu.js-header-component-desktop-profile-menu.state--loaded > div > div > div > div:nth-child(3) > div > a:nth-child(5) > span
${MyRemindersDropdown}    css=body > header > div.profile-menu.js-header-component-desktop-profile-menu.state--loaded > div > div > div > div:nth-child(3) > div > a:nth-child(6) > span

*** Keywords ***
Sign Out
    Click Element    ${SignOutDropdown}    #Clicking Sign Out in profile header dropdown
    Wait Until Page Contains    Login & Register    30s
    Capture Page Screenshot    UserSignedOut-{index}.png

My TFG Rewards
    Click Element    ${MyTfgRewardsDropdown}    #Clicking My TFG Rewards in profile dropdown
    Wait Until Page Contains    My TFG Rewards    30s
    Capture Page Screenshot    MyTFGRewards-{index}.png

My Wish List
    Click Element    ${MyWishListDropDown}    #Clicking Wish List in profile dropdown for My_TFG_World    #Clicking Wish List in profile dropdown for any of the Ecom_Site
    Wait Until Page Contains    WISHLIST    30s
    Capture Page Screenshot    MyWishList-{index}.png

My Referrals
    Click Element    ${MyReferralsDropDown}    #Clicking My Referrals in profile dropdown for My_TFG_World    #Clicking My Referrals in profile dropdown for any of the Ecom_Site
    Wait Until Page Contains    Your Referrals    30s
    Capture Page Screenshot    MyReferrals-{index}.png

My Reminders
    Click Element    ${MyRemindersDropDown}    #Clicking My Reminders in profile dropdown for My_TFG_World    #Clicking My Reminders in profile dropdown for any of the Ecom_Site
    Wait Until Page Contains    My Reminders    30s
    Capture Page Screenshot    MyReminders-{index}.png