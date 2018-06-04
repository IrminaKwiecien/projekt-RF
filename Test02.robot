
*** Settings ***

Library   Selenium2Library

*** Variables ***

${Invalid_discount}         A2A2A2A2
${SERWER}       /www.sukienkimm.pl/sukienki/na-wesele
${BROWSER}      Chrome
${LOGIN URL}    http://${SERWER}/
${expected message}     BŁĄD: KOD NIEPOPRAWNY

*** Test Cases ***

Test01
    Open Maximized Browser
    Check Dress
    Scroll Page To Location   0      500
    Press Code
    Submit Credentials

*** Keywords ***

Open Maximized Browser
      Open Browser            ${LOGIN URL}  ${BROWSER}
      Maximize Browser Window

Check Dress
      Click Element     id: close-cookie-info
      Click Element     css: .pr_list_div
      Click Element     css: .atts_6
      Sleep     2s
      Click Element     id: add2BasketBtn
      Sleep     2s
      Input Text        id: pcode   ${Invalid_discount}

Scroll Page To Location
     [Arguments]    ${x_location}    ${y_location}
     Execute JavaScript    window.scrollTo(${x_location},${y_location})
     Sleep      2s

Press Code
      Press Key     id: pcode    \\13
      Sleep      4s

Submit Credentials
      Frame Should Contain      xpath://*[starts-with(@id,'nyromodal-iframe')]       ${expected message}
      Close All browsers

