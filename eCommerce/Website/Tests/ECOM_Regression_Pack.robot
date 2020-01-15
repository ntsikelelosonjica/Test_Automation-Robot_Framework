*** Settings ***
Test Teardown     Close Browser
Library           SeleniumLibrary    # importing the SeleniumLibrary
Library           FakerLibrary    # importing fakerlibrary to create fake test data
Library           String
Library           DatabaseLibrary
Library           ExcelRobot
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
Resource          ../Resources/GiftRegistryResource.robot

*** Variables ***

*** Test Cases ***
Sign In Existing Email
    [Documentation]    Signs In customers using their email addresses: The Email Addresses    #Using conditions
    ...    are stored in a list named @{SignInEmailAll} and can be found in the
    ...    ECOM_Variables.robot resource file that has all the test data required.
    ...    The use of the FOR loop is so that we :
    ...    1) iterate through the @{browsers} list to run the TC in different browsers
    ...    2) iterate through the @{sites} list to visit different ecommerce sites
    ...    3) iterate through the @{SignInEmailAll} list to sign in with all the email addressess
    ${LengthOfList}=    Get Length    ${SignInEmailAll}    #Using @{SignInEmailAll} list from ECOM_Variables.robot
    : FOR    ${index}    IN RANGE    ${LengthOfList}
    \    Set Global Variable    ${index}
    \    Run Keyword and Continue On Failure    Sign In    #Using Sign In user defined keyword from SignInResource.robot
    \    Run Keyword and Continue On Failure    Type Existing Email Address to Sign In with Correct Password    ${index}    #Using Type Email Address to Sign In user defined keyword from SignInResources.robot
    [Teardown]

Sign In Non Existing Email
    Setting Up the index Variable
    Sign In
    Type Fake Email Address to Sign In

Sign In Existing Phone
    [Documentation]    Sign In Phone : Signs In customers using their email addresses:
    ...    The Email Addresses are stored in a list named @{SignInPhoneAll} and
    ...    can be found in the ECOM_Variables.robot resource file that has all
    ...    the test data required.
    ...    The use of the FOR loop is so that we :
    ...    1) iterate through the @{SignInPhonelAll} list to sign in with all the email addressess.
    ...    2) iterate through the @{browsers} list to open different browsers
    ...    3) iterate through the @{sites} list to visit different ecommerce sites
    Setting Up the index Variable
    Sign In    #Using Sign In user defined keyword from SignInResource.robot
    Type Existing Phone Number to Sign In    ${index}    #Using Type Email Address in Sign In user defined keyword from SignInResources.robot
    [Teardown]

Sign In Non Existing Phone
    Setting Up the index Variable
    Sign In
    Type Fake Phone Number to Sign In

Sign In with Wrong Password
    Setting Up the index Variable
    Sign In
    Type Existing Email Address to Sign In with Incorrect Password    ${index}

Register Email without card
    Setting Up the index Variable
    Register    #Using Register user defined keyword from RegisterResource.robot
    Type Email Address to Register Without a Card
    [Teardown]

Register Phone without card
    Setting Up the index Variable
    Register    #Using Register user defined keyword from RegisterResource.robot
    Type Phone Number to Register Without a Card
    [Teardown]

Register with Card
    ${LengthOfList}=    Get Length    ${RegCardNumberAll}
    : FOR    ${index}    IN RANGE    ${LengthOfList}
    \    Set Global Variable    ${index}
    \    Run Keyword and Continue On Failure    Register
    \    Run Keyword and Continue On Failure    Register With a Card    ${index}
    \    Sleep    10s
    \    Run Keyword and Continue On Failure    Convert Masked Cell No To Text Register
    \    Run Keyword and Continue On Failure    Connect To DB and Complete Registration
    [Teardown]

Link Card to an Online Profile
    ${LengthOfList}=    Get Length    ${LinkCardNumberAll}
    : FOR    ${index}    IN RANGE    ${LengthOfList}
    \    Set Global Variable    ${index}
    \    Run Keyword and Continue On Failure    Register
    \    Run Keyword and Continue On Failure    Type Phone Number to Register Without a Card
    \    Run Keyword and Continue On Failure    Profile Icon in Header
    \    Run Keyword and Continue On Failure    My Accounts Page
    \    Run Keyword and Continue On Failure    Link Card    ${index}
    \    Run Keyword and Continue On Failure    Convert Masked Cell No To Text Link
    \    Run Keyword and Continue On Failure    Connect To DB and Complete Linking
    [Teardown]

View and Edit Profile
    ${LengthOfList}=    Get Length    ${SignInPhoneWithoutCard}
    : FOR    ${index}    IN RANGE    ${LengthOfList}
    \    Set Global Variable    ${index}
    \    Run Keyword and Continue On Failure    Sign In    #Using Sign In user defined keyword from SignInResource.robot
    \    Run Keyword and Continue On Failure    Type Existing Phone Number to Sign In    ${index}    #Using Type Phone Number in Sign In user defined keyword
    \    Run Keyword and Continue On Failure    Profile Icon in Header    #Using Profile Icon in Header user defined keyword from ProfileHeaderResource.robot
    \    Run Keyword and Continue On Failure    My Profile Page
    \    Run Keyword and Continue On Failure    Edit First Name
    \    Run Keyword and Continue On Failure    Edit Last Name
    \    Run Keyword and Continue On Failure    Edit Email Address
    \    Run Keyword and Continue On Failure    Edit Discovery Healthy Gear Card
    \    Run Keyword and Continue On Failure    Save Profile Button
    [Teardown]

View My Accounts Page
    ${LengthOfList}=    Get Length    ${SignInEmailAll}
    : FOR    ${index}    IN RANGE    ${LengthOfList}
    \    Set Global Variable    ${index}
    \    Run Keyword and Continue On Failure    Sign In    #Using Sign In user defined keyword from SignInResource.robot
    \    Run Keyword and Continue On Failure    Type Existing Email Address to Sign In with Correct Password    ${index}    #Using Type Phone Number in Sign In user defined keyword
    \    Run Keyword and Continue On Failure    Profile Icon in Header    #Using Profile Icon in Header user defined keyword from ProfileHeaderResource.robot
    \    Run Keyword and Continue On Failure    My Accounts Page
    [Teardown]

View An Account
    ${LengthOfList}=    Get Length    ${SignInEmailAll}
    : FOR    ${index}    IN RANGE    ${1}    #${LengthOfList}    #had to hard code to take only specific profile
    \    Set Global Variable    ${index}
    \    Run Keyword and Continue On Failure    Sign In    #Using Sign In user defined keyword from SignInResource.robot
    \    Run Keyword and Continue On Failure    Type Existing Email Address to Sign In with Correct Password    ${3}    #${index}    #Using Type Phone Number in Sign In user defined keyword
    \    Run Keyword and Continue On Failure    Profile Icon in Header    #Using Profile Icon in Header user defined keyword from ProfileHeaderResource.robot
    \    Run Keyword and Continue On Failure    My Accounts Page
    \    Run Keyword and Continue On Failure    View An Account
    [Teardown]

Make a TFG Account Payment EFT
    ${LengthOfList}=    Get Length    ${SignInEmailAll}
    : FOR    ${index}    IN RANGE    ${1}    #${LengthOfList}    #had to hard code to take only specific profile
    \    Set Global Variable    ${index}
    \    Run Keyword and Continue On Failure    Sign In    #Using Sign In user defined keyword from SignInResource.robot
    \    Run Keyword and Continue On Failure    Type Existing Email Address to Sign In with Correct Password    ${3}    #${index}    #Using Type Phone Number in Sign In user defined keyword
    \    Run Keyword and Continue On Failure    Profile Icon in Header    #Using Profile Icon in Header user defined keyword from ProfileHeaderResource.robot
    \    Run Keyword and Continue On Failure    My Accounts Page
    \    Run Keyword and Continue On Failure    Make Payment With EFT
    [Teardown]

Make a TFG Account Payment CC
    ${LengthOfList}=    Get Length    ${SignInEmailAll}
    : FOR    ${index}    IN RANGE    ${1}    #${LengthOfList}    #had to hard code to take only specific profile
    \    Set Global Variable    ${index}
    \    Run Keyword and Continue On Failure    Sign In    #Using Sign In user defined keyword from SignInResource.robot
    \    Run Keyword and Continue On Failure    Type Existing Email Address to Sign In with Correct Password    ${3}    #${index}    #Using Type Phone Number in Sign In user defined keyword
    \    Run Keyword and Continue On Failure    Profile Icon in Header    #Using Profile Icon in Header user defined keyword from ProfileHeaderResource.robot
    \    Run Keyword and Continue On Failure    My Accounts Page
    \    Run Keyword and Continue On Failure    Make Payment With Credit Card
    [Teardown]

View Transactions
    ${LengthOfList}=    Get Length    ${SignInEmailAll}
    : FOR    ${index}    IN RANGE    ${1}    #${LengthOfList}    #had to hard code to take only specific profile
    \    Set Global Variable    ${index}
    \    Run Keyword and Continue On Failure    Sign In    #Using Sign In user defined keyword from SignInResource.robot
    \    Run Keyword and Continue On Failure    Type Existing Email Address to Sign In with Correct Password    ${3}    #${index}    #Using Type Phone Number in Sign In user defined keyword
    \    Run Keyword and Continue On Failure    Profile Icon in Header    #Using Profile Icon in Header user defined keyword from ProfileHeaderResource.robot
    \    Run Keyword and Continue On Failure    My Accounts Page
    \    Run Keyword and Continue On Failure    View Transactions
    [Teardown]

View and Edit My Address
    ${LengthOfList}=    Get Length    ${SignInEmailAll}
    : FOR    ${index}    IN RANGE    ${1}
    \    Set Global Variable    ${index}
    \    Run Keyword and Continue On Failure    Sign In
    \    Run Keyword and Continue On Failure    Type Existing Email Address to Sign In with Correct Password    ${index}
    \    Run Keyword and Continue On Failure    Profile Icon in Header
    \    Run Keyword and Continue On Failure    My Address Page
    \    Run Keyword and Continue On Failure    Add New Delivery Address
    [Teardown]

View and Edit My Wishlist
    ${LengthOfList}=    Get Length    ${SignInEmailAll}
    : FOR    ${index}    IN RANGE    ${1}
    \    Set Global Variable    ${index}
    \    Run Keyword and Continue On Failure    Sign In
    \    Run Keyword and Continue On Failure    Type Existing Email Address to Sign In with Correct Password    ${index}
    \    Run Keyword and Continue On Failure    Profile Icon in Header
    \    Run Keyword and Continue On Failure    My Wish List
    [Teardown]

View Gift Registry
    ${LengthOfList}=    Get Length    ${SignInEmailAll}
    : FOR    ${index}    IN RANGE    ${1}
    \    Set Global Variable    ${index}
    \    Run Keyword and Continue On Failure    Sign In
    \    Run Keyword and Continue On Failure    Type Existing Email Address to Sign In with Correct Password    ${index}
    \    Run Keyword and Continue On Failure    Profile Icon in Header
    \    Run Keyword and Continue On Failure    Gift Registry
    [Teardown]

Add New Gift Registry
    Setting Up the index Variable
    Sign In
    Type Existing Email Address to Sign In with Correct Password    ${index}
    Profile Icon in Header
    Add New Gift Registry

Register Email without card Database Validation
    Connect To DataBase Using Custom Params    pymssql    host='10.18.101.83', database='OmniChannelLogDb'
    ${ValidateAndFindCustomerOutgoingMessage}=    Query    select TOP 1 (OutgoingMessage) from OmniChannelLogDb..AuditTransaction with(nolock) where OperationName = 'ValidateAndFindCustomer' and ([IncomingMessage].value('(/data/*/Email)[1]', 'VARCHAR(50)') = '${FakeEmail}') Order By DateCreated desc
    ${Exception}=    Query    select TOP 1 (Exception) from OmniChannelLogDb..AuditTransaction with(nolock) where OperationName = 'ValidateAndFindCustomer' and ([IncomingMessage].value('(/data/*/Email)[1]', 'VARCHAR(50)') = 'ernest77@goodwin-martinez.com ') Order By DateCreated Desc
    ${ValidateAndFindCustomerOutgoingMessageToString}=    Convert To String    ${ValidateAndFindCustomerOutgoingMessage}
    ${ExceptionToString}=    Convert To String    ${Exception}
    Should Match Regexp    ${ValidateAndFindCustomerOutgoingMessageToString}    <Success>true</Success>
    Should Match Regexp    ${ExceptionToString}    None

place order
    ${index}=    Convert To Integer    0
    ${eml}=    Convert To String    ntsikelelo204@gmail.com
    Set Global Variable    ${index}
    Set Global Variable    ${eml}
    Sign In
    Type Email Address to Sign In    ${eml}
    Add To Bag

Home Page
    Open Excel    a.xlsx
    @{emails}=    Get Column Values    Sheet1    0
    @{passwords}=    Get Column Values    Sheet1    1
    Comment    ${tuple0}=    Set Variable    @{emails}[0]
    Comment    ${dtype1}=    Evaluate    type($emails).__name__
    Comment    ${dtype2}=    Evaluate    type($tuple0).__name__
    Comment    Log    ${tuple0}[1]
    ${LengthOfList1}=    Get Length    ${emails}
    :FOR    ${index1}    IN RANGE    ${LengthOfList1}
    \    Comment    @{tuples}[${index1}]=    Set Variable    ${emails}[${index1}]
    \    Log    ${emails}[${index1}]
    Comment    :FOR    ${index2}    IN    ${emails}
    Comment    \    Log    ${index2}
