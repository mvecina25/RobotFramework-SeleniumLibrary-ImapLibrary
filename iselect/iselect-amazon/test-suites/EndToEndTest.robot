*** Settings ***
Documentation    Suite description

Library  SeleniumLibrary
Library  SikuliLibrary
Library  OperatingSystem
Library  String
Library  Collections

Resource  ../../iselect-core/helper/BrowerSetup.robot
Resource  ../../iselect-amazon/resources/page-objects/LoginPage.robot
Resource  ../../iselect-amazon/resources/page-objects/HomePage.robot
Resource  ../../iselect-amazon/resources/page-objects/ShoppingCartPage.robot
Resource  ../../iselect-amazon/resources/test-data/testdata.robot
Resource  ../../iselect-amazon/resources/page-objects/SearchPage.robot
Resource  ../../iselect-amazon/resources/page-objects/ItemPage.robot
Resource  ../../iselect-amazon/resources/page-objects/CheckoutPage.robot

Test Setup  Run Keywords  Init Browser
Suite Teardown  Run Keywords  Stop Remote Server  Delete Sikuli Logs and Captured Images
Test Teardown  Close Browser
Test Template  Shop an item

*** Test Cases ***
#                       ITEMS TO SEARCH
TC1                     ${item1}
#TC2                     ${item2}
#TC3                     ${item3}

*** Keywords ***
Shop an item
    [Arguments]  ${item}
    Click account to sign in
    Login with default credentials
    Enter otp code via api
    Verify home page
    Go to shopping cart page
    Input text to search box ${item}
    Click the search button
    Click the searched item ${item1Image}
    Click the add to cart button
    Click the sidesheet card button
    Click the proceed to checkout button
    Verify check out page