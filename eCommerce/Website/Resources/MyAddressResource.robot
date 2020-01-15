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
Resource          ../Resources/LinkResource.robot
Resource          ../Resources/ECOM_Variables.robot
Resource          ../Resources/RegisterResource.robot
Resource          ../Resources/SalesOrder.robot
Resource          ../Resources/AccountsResource.robot
Resource          ../Resources/GiftRegistryResource.robot

*** Variables ***
${MyAddressDropdown}    xpath=/html/body/header/div[4]/div/div/div/div[2]/div/a[3]/span
${NewAddressButton1}    xpath=/html/body/div[6]/section/div[3]/div/div/div/div[2]/div[2]/div/div/div/div/div/div/a[1]
${NewAddressButton2}    css=body > div.outer-container.js-outer-container.js-header-adjust.state--expand > section > div.inner-container.inner-container--content > div > div > div > div.pg-xs-12-12.pg-md-8-12.pg-lg-9-12 > div.pg-container > a    # xpath=/html/body/div[6]/section/div[3]/div/div/div/div[2]/div[2]/a
${EnterManuallyButton}    xpath=//*[@id="adress_form"]/div[1]/section/fieldset/div[4]/a
${AddressFirstNameField}    id=address-book__firstname
${AddressLastNameField}    id=address-book__lastname
${AddressPhoneNumberField}    id=address-book__number
${DeliveryAddressNameField}    id=address-book__nickname
${StreetAddress1Field}    id=address-book__straddress1
${SuburbField}    id=address-book__suburb
${CityField}      id=address-book__city-town
${PostalCodeField}    id=address-book__postal-code
${RegionDropDown}    xpath=//*[@id="nosui-form-select-address-book__region"]    # //*[@id="nosui-form-select-address-book__region"]/div[1]
${EasternCapeRegion}    xpath=//*[@id="nosui-form-select-address-book__region"]/div[2]/div[2]
${SaveAddressButton}    xpath=//*[@id="adress_form"]/div[1]/section/div/fieldset[7]/div/input[6]

*** Keywords ***
My Address Page
    Click Element    ${MyAddressDropdown}    #Clicking My Address in profile header dropdown
    Wait Until Page Contains    DELIVERY ADDRESS BOOK    30s
    Capture Page Screenshot    MyAddress-{index}.png

Add New Delivery Address
    ${IsNewAddressButton1Visibile}=    Run Keyword And Return Status    Element Should Be Visible    ${NewAddressButton1}
    Run Keyword If    ${IsNewAddressButton1Visibile}    Click Element    ${NewAddressButton1}
    ...    ELSE    Click Element    ${NewAddressButton2}
    Click Element    ${EnterManuallyButton}    #Clicking ENTER MANUALLY button
    ${FirstName}=    Name
    Input Text    ${AddressFirstNameField}    ${FirstName}
    ${LastName}=    Name
    Input Text    ${AddressLastNameField}    ${LastName}
    ${AddressPhoneNumber}=    Cell No
    Input Text    ${AddressPhoneNumberField}    ${AddressPhoneNumber}
    ${DeliveryAddressName}=    Street Name
    Input Text    ${DeliveryAddressNameField}    ${DeliveryAddressName}
    ${StreetAddress1}=    Street Name
    Input Text    ${StreetAddress1Field}    ${StreetAddress1}
    ${Suburb}=    Name
    Input Text    ${SuburbField}    ${Suburb}
    ${City}=    Name
    Input Text    ${CityField}    ${City}
    ${PostalCode}=    Generate Random String    4    [NUMBERS]
    Input Text    ${PostalCodeField}    ${PostalCode}
    Click Element    ${RegionDropDown}    #Click Region
    Click Element    ${EasternCapeRegion}    #Click Eastern Cape
    Click Element    ${SaveAddressButton}    #Click Save Address
    Wait Until Page Contains    Address saved successfully    30s
    Capture Page Screenshot    NewAddressSaved-{index}.png

Edit Existing Delivery Address
