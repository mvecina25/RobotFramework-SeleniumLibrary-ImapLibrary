*** Settings ***
Documentation    Suite description

Library   SeleniumLibrary
Library   Collections


*** Keywords ***

Click
    [Arguments]    ${locator}
    Click Element  ${locator}

Wait then Click
    [Arguments]    ${locator}
    wait until element is visible  ${locator}  20
    Click Element  ${locator}

Set
    [Arguments]  ${locator}  ${text}
    wait until element is visible  ${locator}  5
    Clear Using Back Space  ${locator}
    SeleniumLibrary.Input Text  ${locator}  ${text}
    #Input text  ${locator}  ${text}

Set Text Only
    [Arguments]  ${locator}  ${text}
    SeleniumLibrary.Input Text  ${locator}  ${text}

Clear
    [Arguments]    ${locator}
    Clear Element Text   ${locator}


GetText
    [Arguments]    ${locator}
    ${text}=  SeleniumLibrary.get text  ${locator}
    return from keyword  ${text}

Clear Using Back Space
    [Arguments]  ${locator}
     ${value}=     Get Element Attribute   ${locator}      value
    ${backspace}=    Get Length      ${value}
    FOR  ${ctr}  IN RANGE  ${backspace}
        Press Key  ${locator}  \\08
    END

Soft Assert Element Should Contain
    [Arguments]   ${locator}  @{list}
    ${range}=  Get Length  ${list}
    FOR  ${ctr}  IN RANGE  ${range}
        ${fromlist}=  Get From List  ${list}  ${ctr}
        log to console  Element text: ${fromlist}
        element should contain  ${locator}  ${fromlist}
    END

Soft Assert Element Should Visible
    [Arguments]   @{list}
    ${range}=  Get Length  ${list}
    FOR  ${ctr}  IN RANGE  ${range}
        ${fromlist}=  Get From List  ${list}  ${ctr}
        log to console  Element: ${fromlist}
        element should be visible  ${fromlist}
    END

Soft Assert Element Should Not Visible
    [Arguments]   @{list}
    ${range}=  Get Length  ${list}
    FOR  ${ctr}  IN RANGE  ${range}
        ${fromlist}=  Get From List  ${list}  ${ctr}
        log to console  Element: ${fromlist}
        element should not be visible  ${fromlist}
    END

Soft Assert Table Column Should Visible
    [Arguments]   ${locator}  @{list}
    ${range}=  Get Length  ${list}
    log to console  Range: ${range}

    ${ctr}=  set variable  ${0}
    :FOR  ${current}  IN  ${range}
        log to console  Counter: ${ctr}
        ${columnCount}=  evaluate  ${ctr} + 1
        log to console  Column: ${columnCount}
        ${fromlist}=  Get From List  ${list}  ${ctr}
        log to console  Element text: ${current}
        table column should contain   ${locator}  ${columnCount}  ${fromlist}
    END

