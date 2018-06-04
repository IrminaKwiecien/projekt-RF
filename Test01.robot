*** Settings ***

Library   Selenium2Library

*** Variables ***

${SERWER}       /www.sukienkimm.pl
${BROWSER}      Chrome
${DELAY}        0
${VALID NAME}          Anna
${VALID SURNAME}       NOWAK
${VALID STREET}        PROSTA
${VALID NUMBER}        4
${VALID CODE}          42-789
${VALID CITY}          CRACOV
${VALID EMAIL}         anna.nowak@gmail.com
${VALID PASSWORD}      asdfzxcv
${VALID PASSWORD2}     asdfqwer
${LOGIN URL}           http://${SERWER}/
${expected message}    Potwierdzenie hasła musi być takie same jak hasło !

*** Test Cases ***

Test01
    Open Maximized Browser
    Insert Data
    Submit Credentials

*** Keywords ***

Open Maximized Browser
      Open Browser            ${LOGIN URL}  ${BROWSER}
      Maximize Browser Window
      Set Selenium Speed      ${DELAY}

Insert Data
      Click Element  class: loginIco
      Click Element  class: xlarge
      Input Text     id: usr_first_name  ${VALID NAME}
      Input Text     id: usr_last_name  ${VALID SURNAME}
      Input Text     id: usr_address    ${VALID STREET}
      Input Text     Id: usr_address_str_no  ${VALID NUMBER}
      Input Text     id: usr_post_code  ${VALID CODE}
      Input Text     id: usr_city   ${VALID EMAIL}
      Input Text     id: usr_email  ${VALID EMAIL}
      Input Text     id: usr_password   ${VALID PASSWORD}
      Input Text     id: usr_password_confirm    ${VALID PASSWORD2}
      Click Element  id: usr_terms_agree
      Click Element  id: usr_data_manage
      Click Element  id: close-cookie-info
      Sleep     2s
      Click Element  id: newUser_submit_button
      Sleep     2s
Submit Credentials
      ${message} =	Handle Alert      LEAVE
      Should Be Equal As Strings        ${message}      ${expected message}
      Close All browsers