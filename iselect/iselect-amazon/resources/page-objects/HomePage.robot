*** Settings ***
Documentation    Suite description

Library   SeleniumLibrary
Library   String
Library   Collections
Library   Process

Resource  ../../../iselect-core/helper/SeleniumAction.robot

*** Variables ***
${buttonAccountList}                    //*[@id="nav-link-accountList"]
${textboxSearch}                        //*[@id="twotabsearchtextbox"]
${buttonSearch}                         //*[@id="nav-search"]/form/div[2]/div/input


*** Keywords ***
Verify home page
    element should be visible  ${buttonAccountList}

Click account to sign in
    Click  ${buttonAccountList}

Input text to search box ${searchItem}
    Set  ${textboxSearch}   ${searchItem}

Click the search button
    Click  ${buttonSearch}