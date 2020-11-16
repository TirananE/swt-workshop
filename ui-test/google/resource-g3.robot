*** Variables ***
${URL}    https://www.google.com
${BROWSER}    gc
${KEYWORD}    ริมสระเป็นเหตุสังเกตุได้
${EXPECTED_RESULT}    Pornhub

*** Keywords ***
พิมพ์ google.com
    Open Browser    ${URL}    ${BROWSER}
พิมพ์คำค้น
    Input Text    name:q    ${KEYWORD}
กด Enter
    Press Keys    q    RETURN
ตรวจสอบผลการค้นหา
    Wait Until Page Contains    ${EXPECTED_RESULT}
    Close Browser