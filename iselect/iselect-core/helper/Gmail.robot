*** Settings ***
Documentation    Suite description

Library  SeleniumLibrary
Library  ImapLibrary
Library  String

Resource  ../../iselect-amazon/resources/test-data/config.robot

*** Keywords ***
Get the first OTP message via API
    Open Mailbox  server=imap.gmail.com  user=${gmail_user}  password=${gmail_password}
    ${LATEST}=  Wait for Mail  fromEmail=${amazon_admin}   toEmail=${gmail_user}  timeout=30
    log to console  latest email: ${LATEST}

    ${content}=  Get email body  ${LATEST}
    log to console  content: ${content}

    ${temp}=  fetch from right   ${content}   <p class="otp">
    log to console  text: ${temp}

    ${code}=  fetch from left   ${temp}   </p>
    log to console  otp code: ${code}
    [Return]  ${code}



