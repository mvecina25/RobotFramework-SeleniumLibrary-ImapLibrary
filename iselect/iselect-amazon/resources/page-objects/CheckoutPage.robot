*** Settings ***
Documentation    Suite description

#Resource  ../../../iselect-core/helper/SeleniumAction.robot

*** Variables ***
${stringShippingAddress}            //div[@class='a-container' and contains (., 'Select a shipping address')]

*** Keywords ***
Verify check out page
    element should be visible  ${stringShippingAddress}