*** Settings ***
Library    RequestsLibrary 
Suite Setup    Create Session    alias=shopping    url=https://www.dminer.in.th

*** Variables ***
&{headers}    Content-Type=application/json    Accept=application/json

*** Test Cases ***
user ซื้อของเล่นให้ลูกสาว เลือกวิธีการจัดส่งโดย Kerry และชำระเงินด้วยบัตรเครดิต visa card และชำระเงินสำเร็จ
    Search
    Product Detail
    Submit Order
    Confirm Payment

*** Keywords ***
Search
    ${resp}=    Get Request    alias=shopping    uri=/api/v1/product
    Request Should Be Successful    ${resp}
    Should Be Equal As Integers    ${resp.json()['total']}    2
    Should Be Equal    ${resp.json()['products'][1]["product_name"]}    43 Piece dinner Set
    Should Be Equal As Strings   ${resp.json()['products'][1]["product_price"]}    12.95
    Should Be Equal    ${resp.json()['products'][1]["product_image"]}    /43_Piece_dinner_Set.png

Product Detail
    ${resp}=    Get Request    alias=shopping    uri=/api/v1/product/2    headers=&{headers}
    Request Should Be Successful    ${resp}
    ${product_name}    Set Variable    ${resp.json()['product_name']}
    ${product_price}    Set Variable    ${resp.json()['product_price']}
    ${product_brand}    Set Variable    ${resp.json()['product_brand']}
    Should Be Equal    ${product_name}    43 Piece dinner Set
    Should Be Equal As Numbers    ${product_price}    12.95
    Should Be Equal    ${product_brand}    CoolKidz

Submit Order
    ${data}=    To Json    {"cart" : [{ "product_id": 2,"quantity": 1}],"shipping_method" : "Kerry","shipping_address" : "405/37 ถ.มหิดล","shipping_sub_district" : "ต.ท่าศาลา","shipping_district" : "อ.เมือง","shipping_province" : "จ.เชียงใหม่","shipping_zip_code" : "50000","recipient_name" : "ณัฐญา ชุติบุตร","recipient_phone_number" : "0970809292"}
    ${resp}=    Post Request    alias=shopping    uri=/api/v1/order    headers=&{headers}    json=${data}
    Request Should Be Successful    ${resp}
    ${orderId}=    Set Variable    ${resp.json()['order_id']}
    ${totalPrice}=    Set Variable    ${resp.json()['total_price']}
    Should Be Equal As Integers    ${orderId}    8004359122
    Should Be Equal As Numbers    ${totalPrice}    14.95

Confirm Payment
    ${data}=    To Json    {"order_id" : 8004359122,"payment_type" : "credit","type" : "visa","card_number" : "4719700591590995","cvv" : "752","expired_month" : 7,"expired_year" : 20,"card_name" : "Karnwat Wongudom","total_price" : 14.95}
    ${resp}=    Post Request    alias=shopping    uri=/api/v1/confirmPayment    headers=${headers}    json=${data}
    Request Should Be Successful    ${resp}
    ${notifyMessage}=    Set Variable    ${resp.json()['notify_message']}
    Should Be Equal    ${notifyMessage}    วันเวลาที่ชำระเงิน 1/3/2020 13:30:00 หมายเลขคำสั่งซื้อ 8004359122 คุณสามารถติดตามสินค้าผ่านช่องทาง Kerry หมายเลข 1785261900