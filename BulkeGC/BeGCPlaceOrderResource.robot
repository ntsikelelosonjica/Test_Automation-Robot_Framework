*** Variables ***
${OrderNowButton}    css=body > div.outer-container.js-outer-container.js-header-adjust.state--expand > section > div.inner-container.inner-container--content > div > div > div > div.pg-xs-12-12.pg-md-8-12.pg-lg-9-12 > div.begc-landing > div > div > div > div > a:nth-child(1) > div > span
#-----------------Countries
${SelectCountryDropDown}    id=nosui-form-select-begc-place-order-country-currency
${SouthAfricaOrder}    xpath=//*[@id="nosui-form-select-begc-place-order-country-currency"]/div[2]/div[1]
${NamibiaOrder}    xpath=//*[@id="nosui-form-select-begc-place-order-country-currency"]/div[2]/div[2]
${ZambiaOrder}    xpath=//*[@id="nosui-form-select-begc-place-order-country-currency"]/div[2]/div[3]
${NextButton}     css=body > div.outer-container.js-outer-container.js-header-adjust.state--expand > div > section > div.checkout.js-tfg-view.js-tfg-view-bulk-egift-cards-place-order.js-component-payment-summary-anchor > div.checkout__inner > div > div.checkout__content-column.checkout__content-column--content > div > div.begc-place-order__content > form > div > fieldset:nth-child(3) > div > a
#---------------Brands
${SelectBrandDropDown}    id=nosui-form-select-begc-place-order-card-brand
${home}           xpath=//*[@id="nosui-form-select-begc-place-order-card-brand"]/div[2]/div[2]
${donna}          xpath=//*[@id="nosui-form-select-begc-place-order-card-brand"]/div[2]/div[3]
${DueSouth}       xpath=//*[@id="nosui-form-select-begc-place-order-card-brand"]/div[2]/div[4]
${Exact}          xpath=//*[@id="nosui-form-select-begc-place-order-card-brand"]/div[2]/div[5
${TheFix}         xapth=//*[@id="nosui-form-select-begc-place-order-card-brand"]/div[2]/div[6]
${Foschini}       xpath=//*[@id="nosui-form-select-begc-place-order-card-brand"]/div[2]/div[7]
${Markham}        xpath=//*[@id="nosui-form-select-begc-place-order-card-brand"]/div[2]/div[8]
${Sportscene}     xpath=//*[@id="nosui-form-select-begc-place-order-card-brand"]/div[2]/div[9]
${Sterns}         xpath=//*[@id="nosui-form-select-begc-place-order-card-brand"]/div[2]/div[10]
${Totalsports}    xpath=//*[@id="nosui-form-select-begc-place-order-card-brand"]/div[2]/div[11]
#----------Countries in a list
@{CountriesOrder}    ${SouthAfricaOrder}    ${NamibiaOrder}    ${ZambiaOrder}
#----------Brands in a list
@{Brands}         ${home}    ${donna}    ${DueSouth}    ${Exact}    ${TheFix}    ${Foschini}    ${Markham}
...               ${Sportscene}    ${Sterns}    ${Totalsports}
#----------Values
${ValuePereGiftCardField}    id=begc-place-order-card-value
@{Values}         10000    100    100
#---------Page Elements
${AddButton1a}    css=body > div.outer-container.js-outer-container.js-header-adjust.state--expand > div > section > div.checkout.js-tfg-view.js-tfg-view-bulk-egift-cards-place-order.js-component-payment-summary-anchor > div.checkout__inner > div > div.checkout__content-column.checkout__content-column--content > div > div.begc-place-order__content > form > div > div.begc-place-order__card-form.js-component-begc-place-order-add-form > fieldset:nth-child(4) > div > a > span
${AddButton1b}    xpath=/html/body/div[6]/div/section/div[5]/div[2]/div/div[2]/div/div[1]/form/div/div[1]/fieldset[4]/div/a
${AddButton1c}    xpath=/html/body/div[6]/div/section/div[5]/div[2]/div/div[2]/div/div[1]/form/div/div[1]/fieldset[4]/div/a
@{AddButton1All}    ${AddButton1a}    ${AddButton1b}    ${AddButton1c}
${NextButton1a}    css=body > div.outer-container.js-outer-container.js-header-adjust.state--expand > div > section > div.checkout.js-tfg-view.js-tfg-view-bulk-egift-cards-place-order.js-component-payment-summary-anchor > div.checkout__inner > div > div.checkout__content-column.checkout__content-column--summary > div > div > div.order-summary__content.js-component-order-summary-content > div.order-summary__inner > div.order-summary__btn-list > a
${NextButton1b}    xpath=/html/body/div[6]/div/section/div[5]/div[2]/div/div[1]/div/div/div[1]/div[2]/div[3]/a
${NextButton1c}    xpath=/html/body/div[6]/div/section/div[5]/div[2]/div/div[1]/div/div/div[1]/div[2]/div[3]/a
@{NextButton1All}    ${NextButton1a}    ${NextButton1b}    ${NextButton1c}
${NextButton2a}    css=body > div.outer-container.js-outer-container.js-header-adjust.state--expand > div > section > div.checkout.js-tfg-view.js-tfg-view-bulk-egift-cards-place-order.js-component-payment-summary-anchor > div.checkout__inner > div > div.checkout__content-column.checkout__content-column--summary > div > div > div.order-summary__content.js-component-order-summary-content > div.order-summary__inner > div.order-summary__btn-list > a
${NextButton2b}    xpath=/html/body/div[6]/div/section/div[5]/div[2]/div/div[1]/div/div/div[1]/div[2]/div[3]/a
${NextButton2c}    xpath=/html/body/div[6]/div/section/div[5]/div[2]/div/div[1]/div/div/div[1]/div[2]/div[3]/a
@{NextButton2All}    ${NextButton2a}    ${NextButton2b}    ${NextButton2c}
${DeliveryCheckBox}    name=begc-place-order-alternative-delivery    #Not really used
${ContactDetatilsCheckBox}    id=begc-place-order-delivery-terms-accept
${NextButton3a}    xpath=/html/body/div[6]/div/section/div[5]/div[2]/div/div[1]/div/div/div[1]/div[2]/div/a
${NextButton3b}    xpath=/html/body/div[6]/div/section/div[5]/div[2]/div/div[1]/div/div/div[1]/div[2]/div[3]/a
${NextButton3c}    xpath=/html/body/div[6]/div/section/div[5]/div[2]/div/div[1]/div/div/div[1]/div[2]/div[3]/a
@{NextButton3All}    ${NextButton3a}    ${NextButton3b}    ${NextButton3c}
${TsAndCsCheckBox}    name=begc-place-order-payment-terms
${SubmitOrderButtona}    xpath=/html/body/div[6]/div/section/div[5]/div[2]/div/div[1]/div/div/div[1]/div[2]/div/a
${SubmitOrderButtonb}    xpath=/html/body/div[6]/div/section/div[5]/div[2]/div/div[1]/div/div/div[1]/div[2]/div/a
${SubmitOrderButtonc}    xpath=/html/body/div[6]/div/section/div[5]/div[2]/div/div[1]/div/div/div[1]/div[2]/div/a
@{SubmitOrderButtonAll}    ${SubmitOrderButtona}    ${SubmitOrderButtonb}    ${SubmitOrderButtonc}
#----------Payment Methods
${selectPaymentMethodDropDown}    id=nosui-form-select-begc-place-order-payment-method
${CreditCard}     xpath=//*[@id="begc-place-order-payment-method"]/option[1]
${InstantEFT}     xpath=//*[@id="begc-place-order-payment-method"]/option[2]
${DirectPayment}    xpath=//*[@id="begc-place-order-payment-method"]/option[3]

*** Keywords ***
Place Bulk eGift Card Order External Customer
    : FOR    ${INDEX}    IN RANGE    0    1
    \    Register    #User defined keyword from BeGCRegisterResource.robot
    \    Type Email Address to Register Without a Card    #User defined keyword from BeGCRegisterResource.robot
    \    Register Corporate with Email    #User defined keyword from BeGCRegisterResource.robot
    \    Click Element    ${OrderNowButton}
    \    Click Element    ${SelectCountryDropDown}    #clicking the country dropdown
    \    Click Element    ${CountriesOrder[${index}]}    #Selecting country at index of countries
    \    Click Element    ${NextButton}    #Clicking Next Button
    \    Click Element    ${SelectBrandDropDown}    #clicking the brand dropdown
    \    Click Element    ${Brands[${index}]}    #Selecting brand at index of brands
    \    Input Text    ${ValuePereGiftCardField}    ${Values[${index}]}    #inputing amount of eGift Card at index of values
    \    Click Element    ${AddButton1All[${index}]}
    \    Click Element    ${NextButton1All[${index}]}
    \    Click Element    ${NextButton2All[${index}]}
    \    Sleep    5s
    \    Select Checkbox    ${ContactDetatilsCheckBox}
    \    Click Element    ${NextButton3All[${index}]}
    \    Select Checkbox    ${TsAndCsCheckBox}
    \    Click Element    ${SubmitOrderButtonAll[${index}]}
    \    Wait Until Page Contains    Your order number is    30s
    \    Sleep    5s
    \    Capture Page Screenshot    BeGC_Order_Placed-{index}.png
