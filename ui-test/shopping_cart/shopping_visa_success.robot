# final มีหน้าจะ ui มาให้ละให้เขียนแบบนี้
*** Settings ***
Library    SeleniumLibrary 
Suite Teardown    Close All Browsers

*** Variables ***

*** Test Cases ***
user ซื้อของเล่นให้ลูกสาว เลือกวิธีการจัดส่งโดย Kerry และชำระเงินด้วยบัตรเครดิต visa card และชำระเงินสำเร็จ
    แสดงสินค้า
    แสดงรายระเอียดสินค้า
    ระบุจำนวนสินค้าที่จะซื้อ
    นำสินค้าใส่ตะกร้า
    ยืนยันการสั่งซื้อและชำระเงิน
    ชำระเงินด้วยบัตรเครดิต visa card
    ขอบคุณ

*** Keywords ***
แสดงสินค้า
    open browser    https://www.dminer.in.th/Product-list.html    chrome
    Element Should Contain    id: productName-1    43 Piece Dinner Set
    Element Should Contain    id: productPrice-1    12.95 USD

แสดงรายระเอียดสินค้า
    Click Button    id: viewMore-1
    Wait Until Element Contains    id: productName    43 Piece dinner Set
    Element Should Contain    id: productName    43 Piece dinner Set
    Element Should Contain    id: productBrand   CoolKidz
    Element Should Contain    id: productPrice    12.95 USD

ระบุจำนวนสินค้าที่จะซื้อ
    Input Text    id: productQuantity    1

นำสินค้าใส่ตะกร้า
    Click Button    id: addToCart

ยืนยันการสั่งซื้อและชำระเงิน
    Wait Until Element Contains    id: receiverName    ณัฐญา ชุติบุตร
    Wait Until Element Contains    id: recevierAddress    405/37 ถ.มหิดล ต.ท่าศาลา อ.เมือง จ.เชียงใหม่ 50000
    Wait Until Element Contains    id: recevierPhonenumber    0970809292
    Wait Until Element Contains    id: totalProductPrice    12.95 USD
    Click Button    id: confirmPayment

ชำระเงินด้วยบัตรเครดิต visa card
    Wait Until Element Contains    id: totalPrice    241.90 
    Input Text    id: cardNumber    4719700591590995
    Input Text    id: expiredMonth    7
    Input Text    id: expiredYear    20
    Input Text    id: cvv    752
    Input Text    id: cardName    Karnwat Wongudom
    Click Button    id: Payment

ขอบคุณ
    Wait Until Element Contains    id: title    ชำระเงินสำเร็จ
    Click Button    id: goHome