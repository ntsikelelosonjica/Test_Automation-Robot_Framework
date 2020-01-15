*** Settings ***
Library           SeleniumLibrary    # importing the ExtendedSelenium2Library
Library           FakerLibrary    # importing fakerlibrary to create fake test data
Library           String
Library           DatabaseLibrary
Library           ../Libraries/testcellphone.py
Resource          ../Resources/SignInResource.robot    #importing the RegisterResource.robot resource file to use keywords in file
Resource          ../Resources/CommonResource.robot
Resource          ../Resources/ProfileHeaderResource.robot
Resource          ../Resources/MyAddressResource.robot
Resource          ../Resources/LinkResource.robot
Resource          ../Resources/ECOM_Variables.robot
Resource          ../Resources/RegisterResource.robot
Resource          ../Resources/SalesOrder.robot
Resource          ../Resources/AccountsResource.robot
Resource          ../Resources/GiftRegistryResource.robot

*** Variables ***
${MyProfileDropdown}    css=body > header > div.profile-menu.js-header-component-desktop-profile-menu.state--loaded > div > div > div > div:nth-child(2) > div > a:nth-child(1) > span
${FirstNameField}    id=update_profile_first_name
${LastNameField}    id=update_profile_last_name
${EmailField}     id=update_profile_contact_email
${PhoneNumberField}    id=update_profile_contact_mobile_number
${DiscoveryNumberField}    id=update_profile_discovery_card
${SaveProfileButton}    css=body > div.outer-container.js-outer-container.js-header-adjust.state--expand > section > div.inner-container.inner-container--content > div > div > div > div.pg-xs-12-12.pg-md-8-12.pg-lg-9-12 > div > div.update-profile__content > form.update-profile__form.js-component-user-profile-form.js-component-user-profile-details-form > fieldset > div > input    # xpath=/html/body/div[6]/section/div[3]/div/div/div/div[2]/div/div[4]/form[2]/fieldset/div/input

*** Keywords ***
My Profile Page
    Click Element    ${MyProfileDropdown}    #Clicking My Profile in profile header dropdown
    Wait Until Page Contains    Personal Details    30s
    Capture Page Screenshot    MyProfile-{index}.png

Edit First Name
    ${NewName}=    User Name
    Input Text    ${FirstNameField}    ${NewName}

Edit Last Name
    ${NewLastName}=    Last Name
    Input Text    ${LastNameField}    ${NewLastName}

Edit Email Address
    ${NewEmail}=    Email
    Input Text    ${EmailField}    ${NewEmail}

Edit Mobile Number
    ${NewNumber}=    0753211235
    Input Text    ${PhoneNumberField}    ${NewNumber}

Edit Discovery Healthy Gear Card
    ${NewDiscovery}=    Generate Random String    16    [NUMBERS]
    Input Text    ${DiscoveryNumberField}    ${NewDiscovery}

Save Profile Button
    Click Element    ${SaveProfileButton}    #Clicking Save Profile button
    Wait Until Page Contains    Profile details saved successfully    40s
    Capture Page Screenshot    ProfileUpdated-{index}.png
