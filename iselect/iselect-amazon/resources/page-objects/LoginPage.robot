*** Settings ***
Documentation    Suite description

Library   SeleniumLibrary
Library   String
Library   Collections
Library   Process

Resource  ../../../iselect-core/helper/SeleniumAction.robot
Resource  ../../../iselect-core/helper/Gmail.robot
Resource  ../../../iselect-amazon/resources/test-data/config.robot
Resource  ../../../iselect-amazon/resources/page-objects/AuthenticationPage.robot


*** Variables ***
${usernameField}                    //input[@id='ap_email']
${passwordField}                    //input[@id='ap_password']
${continueBtn}                      //input[contains(@id,'continue')]
${loginBtn}                         //*[@id="signInSubmit"]


*** Keywords ***
Login with default credentials
    Set  ${usernameField}   ${username}
    Click   ${continueBtn}
    Set  ${passwordField}   ${password}
    Click  ${loginBtn}

Enter otp code via api
    ${flag}=  run keyword and return status  Verify otp message
    log to console  flag: ${flag}
    run keyword if  '${flag}'=='True'  Get and enter the OTP Code via API

Get and enter the OTP Code via API
    Click and send otp button
    ${otp_code}=  get the first otp message via api

    wait until element is visible  ${textboxOTP}  10
    Set  ${textboxOTP}  ${otp_code}
    Click continue button with otp to proceed












