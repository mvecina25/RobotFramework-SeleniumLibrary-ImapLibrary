*** Settings ***
Documentation    Suite description

Resource  ../../../iselect-core/helper/SeleniumAction.robot

*** Variables ***
${buttonAddToCart}          //*[@id="add-to-cart-button"]
${buttonSidesheetCart}      //*[@id="attach-sidesheet-view-cart-button"]
${buttonProceedCheckout}  //*[@id="sc-buy-box-ptc-button"]
#${paneAttachAccessory}      //*[@id="attach-accessory-pane"]/div

*** Keywords ***
Click the add to cart button
    Click  ${buttonAddToCart}

Click the sidesheet card button
    wait until element is visible  ${buttonSidesheetCart}   5
    Click   ${buttonSidesheetCart}

Click the proceed to checkout button
    wait until element is visible  ${buttonProceedCheckout}   5
    Click   ${buttonProceedCheckout}