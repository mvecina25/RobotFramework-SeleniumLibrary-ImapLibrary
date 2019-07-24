*** Settings ***
Documentation    Suite description

Resource  ../../../iselect-core/helper/SeleniumAction.robot

*** Variables ***
${buttonShoppingCart}                    //*[@id="nav-cart"]
${stringShoppingCart}                    //div[@id='sc-active-cart' and contains(., 'Shopping Cart')]

*** Keywords ***
Go to shopping cart page
    Click  ${buttonShoppingCart}
    element should be visible  ${stringShoppingCart}