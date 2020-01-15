*** Settings ***
Library                            SeleniumLibrary                                                                                                                                                                                                                                                                                                                 # importing the ExtendedSelenium2Library
Library                            FakerLibrary                                                                                                                                                                                                                                                                                                                    # importing fakerlibrary to create fake test data
Library                            String
Library                            DatabaseLibrary
Library                            ../Libraries/testcellphone.py
Resource                           ../Resources/SignInResource.robot                                                                                                                                                                                                                                                                                               #importing the RegisterResource.robot resource file to use keywords in file
Resource                           ../Resources/CommonResource.robot
Resource                           ../Resources/ProfileHeaderResource.robot
Resource                           ../Resources/MyProfileResource.robot
Resource                           ../Resources/MyAddressResource.robot
Resource                           ../Resources/ECOM_Variables.robot
Resource                           ../Resources/RegisterResource.robot
Resource                           ../Resources/SalesOrder.robot
Resource                           ../Resources/AccountsResource.robot
Resource                           ../Resources/GiftRegistryResource.robot


*** Variables ***
${LinkCardButtonOne}               css=body > div.outer-container.js-outer-container.js-header-adjust.state--expand > section > div.inner-container.inner-container--content > div > div > div > div.pg-xs-12-12.pg-md-8-12.pg-lg-9-12.my-accounts > div.pg-container.pg-container--no-padding > div > a                                                           # xpath=/html/body/div[6]/section/div[3]/div/div/div/div[2]/div[2]/div/a
${CardNumberFieldLink}             id=payment-info__form__link-card__number
${LinkCardButtonTwo}               xpath=//*[@id="linkCard_form"]/fieldset[2]/div/input[1]
${MaskedCellNoFieldLink}           css=body > div.outer-container.js-outer-container.js-header-adjust.state--expand > section > div.inner-container.inner-container--content > div > div > div > div.pg-xs-12-12.pg-md-8-12.pg-lg-9-12 > div.pg-container.pg-container--no-padding > div > div > div > div.payment-info__form__otp > div > ul > li:nth-child(2)    # xpath=/html/body/div[6]/section/div[3]/div/div/div/div[2]/div[2]/div/div/div/div[2]/div/ul/li[2]
${OTPFieldLink}                    xpath=//*[@id="payment-info__form__otp__number"]
${GoButton}                        xpath=//*[@id="linkCardWithOTP_form"]/fieldset[2]/div/input[3]
${TFGCardLinkedTextLocator}        xpath=/html/body/div[6]/section/div[3]/div/div/div/div[2]/div[2]#TFG card linked successfully
${RewardsCardLinkedTextLocator}    xpath=/html/body/div[6]/section/div[3]/div/div/div/div[2]/div[1]/h1 #My TFG Rewards

*** Keywords ***
Link Card
    [Arguments]                                ${index}
    Click Element                              ${LinkCardButtonOne}
    Input Text                                 ${CardNumberFieldLink}                  ${LinkCardNumberAll[${index}]}
    Click Element                              ${LinkCardButtonTwo}
    Wait Until Page Contains                   PLEASE ENTER YOUR ONE TIME PIN (OTP)

Convert Masked Cell No To Text Link
    ${MaskedCellNoFieldToTextLink}=            Get Text                                ${MaskedCellNoFieldLink}
    ${NewMaskedCellNoFieldToTextLink}=         Fetch From Right                        ${MaskedCellNoFieldToTextLink}                                                                                                  o
    Set Global Variable                        ${NewMaskedCellNoFieldToTextLink}

Connect To DB and Complete Linking
    sleep                                      10s
    Connect To DataBase Using Custom Params    pymssql                                 host='10.18.101.83', database='OmniChannelLogDb'
    ${OTP}=                                    Query                                   select top 1 (Pin) from OneTimePin where MaskedCellNumber in ('${NewMaskedCellNoFieldToTextLink}') order by DateCreated desc
    Input Text                                 ${OTPFieldLink}                         ${OTP[0][0]}
    Click Element                              ${GoButton}
    ${IsTFGCardLinkedTextLocatorVisible}       Run Keyword And Return Status           Element Should Be Visible                                                                                                       ${TFGCardLinkedTextLocator}
    Run Keyword If                             ${IsTFGCardLinkedTextLocatorVisible}    Wait Until Page Contains                                                                                                        TFG card linked successfully
    ...                                        ELSE                                    Wait Until Page Contains                                                                                                        My TFG Rewards
    #Wait Until Page Contains    TFG card linked successfully
    Capture Page Screenshot                    CustomerCardLinked-{index}.png
