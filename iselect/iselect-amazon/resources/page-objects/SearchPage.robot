*** Settings ***
Documentation    Suite description

Resource  ../../../iselect-core/helper/SeleniumAction.robot


*** Keywords ***
Click the searched item ${itemSearched}
    Click  ${itemSearched}