*** Settings ***
Library    SeleniumLibrary

*** Variables ***   
# Enter your email and your password here
${EMAIL}    
${PASSWORD}    

*** Test Cases ***
Post status facebook
    เข้า browser + พิมพ์ facebook.com
    พิมพ์ email กับ password เพื่อ Login
    กดปุ่ม Login
    คลิกโพสเพื่อพิมพ์ข้อความ
    พิมพ์สิ่งที่จะโพส
    กดปุ่ม Post
    
*** Keywords ***
เข้า browser + พิมพ์ facebook.com
    Open Browser    https://www.facebook.com    chrome
พิมพ์ email กับ password เพื่อ Login
    Input Text    name: email    ${EMAIL}
    Input Text    name: pass    ${PASSWORD}
กดปุ่ม Login
    Click Button    name: login
คลิกโพสเพื่อพิมพ์ข้อความ
    Wait Until Page Contains    คุณคิดอะไรอยู่
    Click Element    css: div.oajrlxb2.b3i9ofy5.qu0x051f.esr5mh6w.e9989ue4.r7d6kgcz.rq0escxv.nhd2j8a9.j83agx80.p7hjln8o.kvgmc6g5.cxmmr5t8.oygrvhab.hcukyx3x.cxgpxx05.d1544ag0.sj5x9vvc.tw6a2znq.i1ao9s8h.esuyzwwr.f1sip0of.lzcic4wl.l9j0dhe7.abiwlrkh.p8dawk7l.bp9cbjyn.orhb3f3m.czkt41v7.fmqxjp7s.emzo65vh.btwxx1t3.buofh1pr.idiwt2bm.jifvfom9.ni8dbmo4.stjgntxs.kbf60n1y
พิมพ์สิ่งที่จะโพส
    Wait Until Page Contains    เพิ่มลงในโพสต์ของคุณ
    Press Keys    None    สวัสดี robot framework
กดปุ่ม Post
    Click Element    css: div.oajrlxb2.s1i5eluu