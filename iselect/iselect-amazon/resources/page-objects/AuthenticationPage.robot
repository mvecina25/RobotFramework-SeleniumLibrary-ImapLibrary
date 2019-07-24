*** Settings ***
Documentation    Suite description

Resource  ../../../iselect-core/helper/SeleniumAction.robot

*** Variables ***
${stringAuthenticationMessage}      //div[@id='cvf-page-content' and contains(., 'Authentication required')]
${buttonSendOTP}                    //*[@id="continue"]
${textboxOTP}                       //*[@id="cvf-page-content"]/div/div/div[1]/form/div[2]/input
${buttonContinue}                   //*[@id="a-autoid-0"]/span/input

*** Keywords ***
Verify otp message
    element should be visible  ${stringAuthenticationMessage}

Click and send otp button
    Click  ${buttonSendOTP}

Click continue button with otp to proceed
    Click  ${buttonContinue}
