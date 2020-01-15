*** Variables ***
#---Web Browsers
${chromebrowser}    chrome
${firefoxbrowser}    firefox
${iebrowser}      ie
${operabrowser}    opera
@{browsers}       ${chromebrowser}    ${chromebrowser}    ${chromebrowser}    ${chromebrowser}    ${chromebrowser}
#---------------Ecom Sites-----------------------------------------------
${credentials}    tfg:fjzgMSdS0fkB@
${mytfg}          https://${credentials}mytfg.tfguat.co.za/
${home}           https://${credentials}home.tfguat.co.za/
${markham}        https://${credentials}markham.tfguat.co.za/
${donna}          https://${credentials}donna.tfguat.co.za/
${fabiani}        https://${credentials}fabiani.tfguat.co.za/home
${duesouthescapes}    https://${credentials}duesouthescapes.tfguat.co.za/home
${foschini}       https://${credentials}foschini.tfguat.co.za/home
${foschiniforbeauty}    https://${credentials}foschiniforbeauty.tfguat.co.za/home
${exact}          https://${credentials}exact.tfguat.co.za/home
${thefix}         https://${credentials}thefix.tfguat.co.za/home
${archivestore}    https://${credentials}archivestore.tfguat.co.za/home
${hi-online}      https://${credentials}hi-online.tfguat.co.za/home
${totalsports}    https://${credentials}totalsports.tfguat.co.za/home
${sodabloc}       https://${credentials}sodabloc.tfguat.co.za/home
${relayjeans}     https://${credentials}relayjeans.tfguat.co.za/home
${sportscene}     https://${credentials}sportscene.tfguat.co.za/home
${duesouth}       https://${credentials}duesouth.tfguat.co.za/home
@{sites}          ${home}    ${sportscene}    ${hi-online}    ${totalsports}    ${fabiani}    ${donna}    ${mytfg}
...               ${duesouthescapes}    ${foschini}    ${exact}    ${foschiniforbeauty}    ${thefix}    ${archivestore}    ${sodabloc}
...               ${relayjeans}    ${duesouth}    ${markham}
#-------------BigBuy Account Registeration Data---------------------------CHECKED DONE
${RegCardNumberBigBuy1}    6277438011100363115    #ntsikelelo414@gmail.com/0745113630
${RegCardNumberBigBuy2}    6277438011100363123    #ntsikelelo413@gmail.com/0743213630 : Intrace
${RegCardNumberBigBuy3}    6277438011100363065    #ntsikelelo415@gmail.com/0746503630
@{RegCardNumberBigBuy}    ${RegCardNumberBigBuy1}
#-------------Staff Account Registeration Data---------------------------CHECKED DONE
${RegCardNumberStaff1}    6277430011990949336    #ntsikelelo317@gmail.com/0746339490    ---damaged
${RegCardNumberStaff2}    6277430011068525794    #ntsikelelo319@gmail.com/0744975258
@{RegCardNumberStaff}    ${RegCardNumberStaff2}
#-------------Normal Account Registeration Data--------------------------CHECKED DONE
${RegCardNumberNormal1}    6277430011056687994    #ntsikelelo303@gmail.com/0744997866---------BLOCKED
${RegCardNumberNormal2}    6277430011057808680    #ntsikelelo402@gmail.com/0741898087------Returns many profiles/emails
${RegCardNumberNormal3}    6277430011057854049    #ntsikelelo404@gmail.com/0744904578------Returns many profiles/emails
${RegCardNumberNormal4}    6277430011067136262    #ntsikelelo300@gmail.com/0742626317    --- working
@{RegCardNumberNormal}    ${RegCardNumberNormal4}
#-------------Decorator Account Registeration Data-----------------------CHECKED DONE
${RegCardNumberDecorator1}    6277430011990616364    #ntsikelelo313@gmail.com/0744636160
${RegCardNumberDecorator2}    6277430011990542800    #ntsikelelo401@gmail.com/0741008245-- using
${RegCardNumberDecorator3}    6277430011990055167    #ntsikelelo410@gmail.com/0747615500 -----linked already
@{RegCardNumberDecorator}    ${RegCardNumberDecorator1}
#-------------Cash Rewards Registeration Data----------------------------CHECKED DONE
${RegCardNumberCashRewards1}    99060000117681782    #ntsikelelo405@gmail.com/0742871867
${RegCardNumberCashRewards2}    99060000137838859    #ntsikelelo406@gmail.com/0749588387
@{RegCardNumberCashRewards}    ${RegCardNumberCashRewards1}
#---------------Register for all different account types
@{RegCardNumberAll}    @{RegCardNumberStaff}    @{RegCardNumberNormal}    @{RegCardNumberDecorator}    @{RegCardNumberCashRewards}
#-------------Staff Account Link Card Data-------------------------------
${LinkCardNumberStaff1}    6277430011990887585    #ntsikelelo400@gmail.com/0745857880
${LinkCardNumberStaff2}    6277430011068559058 #Closed Account ntsikelelo311@gmail.com/0748509558
@{LinkCardNumberStaff}    ${LinkCardNumberStaff1}
#-------------Normal Account Link Card Data------------------------------CHECKED DONE
${LinkCardNumberNormal1}    6277430011057808383    #ntsikelelo315@gmail.com/0743838087
${LinkCardNumberNormal2}    6277430011060678534    #ntsikelelo403@gmail.com/0744358760 ------------------------------------------------------------Vision New Methods
${LinkCardNumberNormal3}    6277430011032514825    #ntsikelelo316@gmail.com/0745284152---This card cannot be linked to an online profile due to the status of the account
${LinkCardNumberNormal5}    6277430011065257649    #ntsikelelo307@gmail.com/0749467525/Moratorium/6277430011990513157(secondary)    ---bringing back many online profiles
@{LinkCardNumberNormal}    ${LinkCardNumberNormal1}
#-------------Decorator Account Link Card Data--------------------------- CHECKED DONE
${LinkCardNumberDecorator1}    6277430011990843711    #ntsikelelo407@gmail.com/0741173480
${LinkCardNumberDecorator2}    6277430011990883766    #ntsikelelo408@gmail.com/0746673880
${LinkCardNumberDecorator3}    6277430011990858826    #ntsikelelo409@gmail.com/0746288580
@{LinkCardNumberDecorator}    ${LinkCardNumberDecorator1}
#-------------Cash Rewards Link Data-------------------------------------CHECKED DONE
${LinkCardNumberCashRewards1}    99060000117768415    #ntsikelelo411@gmail.com/0745148677
${LinkCardNumberCashRewards2}    99060000122896136    #ntsikelelo412@gmail.com/0746316982
@{LinkCardNumberRewards}    ${LinkCardNumberCashRewards1}
@{LinkCardNumberAll}    @{LinkCardNumberRewards}    @{LinkCardNumberDecorator}    @{LinkCardNumberNormal}    @{LinkCardNumberStaff}
#-------------Staff Account Login Data-----------------------------------CHECKED DONE
${SignInEmailStaff1}    ntsikelelo202@gmail.com    #6277430011068497275    Good
${SignInEmailStaff2}    ntsikelelo102@gmail.com    #6277430011990858057
${SignInEmailStaff3}    ntsikelelo103@gmail.com    #6277430011068572804
${SignInEmailStaff4}    ntsikelelo1000@gmail.com    #6277430011990452943    Moratuim
${SignInPhoneStaff1}    ${EMPTY}
@{SignInEmailStaff}    ${SignInEmailStaff2}
@{SignInPhoneStaff}
#-------------Normal Account Login data----------------------------------CHECKED DONE
${SignInEmailNormal1}    ntsikelelo204@gmail.com    #6277430011047109421------------------------------------------------------------Vision New Methods
${SignInEmailNormal2}    ntsikelelo205@gmail.com    #6277430011047103077------------------------------------------------------------Vision New Methods
${SignInEmailNormal3}    ntsikelelo321@gmail.com    #6277430011051658628
${SignInEmailNormal4}    ntsikelelo320@gmail.com    #6277430011066686291
${SignInEmailNormal5}    ntsikelelo306@gmail.com    #6277430011006551027 Deliquent
${SignInEmailNormal6}    ntsikelelo305@gmail.com    #6277430011057080611
@{SignInEmailNormal}    ${SignInEmailNormal1}
@{SignInPhoneNormal}
#-----------Decorator Account Login Data---------------------------------CHECKED
${SignInEmailDecorator1}    ntsikelelo101@gmail.com    #6277430011048794775
${SignInEmailDecorator2}    ntsikelelo312@gmail.com    #6277430011990841863
${SignInEmailDecorator3}    ntsikelelo100@gmail.com    #6277430011990918646----Also returns many other online profiles
${SignInPhoneDecorator1}    ${EMPTY}
@{SignInEmailDecorator}    ${SignInEmailDecorator1}
@{SignInPhoneDecorator}
#-------------Cash Rewards Login data------------------------------------CHECKED
${SignInEmailRewards1}    ntsikelelo200@gmail.com    #99060000136646139
${SignInPhoneRewards1}    ${EMPTY}
@{SignInEmailRewards}    ${SignInEmailRewards1}
@{SignInPhoneRewards}
#-------------Without a Card Login Data----------------------------------CHECKED DONE
${SignInEmailWithoutCard1}    amysmith@davila.com
${SignInPhoneWithoutCard1}    0616455237
@{SignInEmailWithoutCard}    ${SignInEmailWithoutCard1}
@{SignInPhoneWithoutCard}    ${SignInPhoneWithoutCard1}
#-------------Airtime account Login Data-----------------------------------------Checked Done
${SignInEmailAirtime1}    ntsikelelo416@gmail.com    #6277430011030709039
${SignInEmailAirtime2}    ntsikelelo415@gmail.com    #6277430011052799983
#---------------Sign In for all different account types
@{SignInEmailAll}    @{SignInEmailWithoutCard}    @{SignInEmailRewards}    @{SignInEmailNormal}    @{SignInEmailDecorator}    @{SignInEmailStaff}
@{SignInPhoneAll}    @{SignInPhoneWithoutCard}
#----------------Database Connection------------------------------------------------
#-------------Password for Login/Registration----------------------------
${password}       password
${incorrectpassword}    password9
#--------------PayU Credentials-----
${PayUCardNumber}    4000015372250142
${PayUCardHolderName}    John Doe
${CVVNumber}      123
