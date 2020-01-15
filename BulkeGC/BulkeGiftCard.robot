*** Settings ***
Library           SeleniumLibrary
Library           FakerLibrary
Library           DatabaseLibrary
Library           String
Library           Process
Library           testcellphone.py
Resource          BeGCRegisterResource.robot
Resource          BeGCCommonResource.robot
Resource          BeGCSignInResource.robot
Resource          BeGC_Variables.robot
Resource          BeGCPlaceOrderResource.robot

*** Variables ***

*** Test Cases ***
Register External Customer using Email
    Register
    Type Email Address to Register Without a Card
    Register Corporate with Email

Register Staff Customer using Email
    ${LengthOfEmployeeNumber}=    Get Length    ${EmployeeNumber}    #Getting the length of the array containing all employee numbers
    : FOR    ${index}    IN RANGE    ${LengthOfEmployeeNumber}
    \    Set Global Variable    ${index}
    \    Register
    \    Type Email Address to Register Without a Card
    \    Register Staff with Email

Place BeGC Order for External Customer
    Place Bulk eGift Card order External Customer    #Imported from BeGCPlaceOrderResource.robot

Place BeGC Order for Internal Customer
