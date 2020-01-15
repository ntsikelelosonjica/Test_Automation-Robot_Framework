*** Variables ***
#---------------------Register or SignIn password
${password}       password
#--------------------Register Card Numbers: Assighning card numbers to variables
${RegCardNumberNormal1}    6277430011079162652    #ntsikelelo309@gmail.com/0742562619
${RegCardNumberNormal2}    6277430011047441162    #ntsikelelo308@gmail.com/0742611447
@{RegCardNumberNormalAll}    ${RegCardNumberNormal1}    ${RegCardNumberNormal2}    #list of card numbers
${userauth}       tfg
${passwordauth}    ps0TuFI6MXNZ
#--------------------The Bulk eGift Card website
${BeGCSite}       https://${userauth}:${passwordauth}@mytfg.tfguat.co.za/myaccount/profile/myAccount.jsp?pageName=bulkegiftcards
#-------- Credit Crad Information
${CrediCardNumber}    5470443148312467
${CreditCardHolderName}    John Doe
${CVVNUmber}    123

