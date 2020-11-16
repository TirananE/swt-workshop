*** Settings ***
Library     SeleniumLibrary
*** Variables ***
${KAIMOOK}    ไข่มุก
 

*** Test Cases ***
ค้นหา
    เข้า browser
    ใส่คำค้นหา


*** Keywords ***
เข้า browser
    Open Browser    https://www.google.co.th    googlechrome
ใส่คำค้นหา
    Input Text    name: q    ${KAIMOOK}    