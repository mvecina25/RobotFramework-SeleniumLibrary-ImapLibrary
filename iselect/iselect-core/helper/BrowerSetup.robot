*** Settings ***
Documentation    Suite description
Library    Process
Library    OperatingSystem


*** Keywords ***
Init Browser
    Run Keyword    Open ${browser} Browser    ${url}

Open Chrome Browser
    [Arguments]    ${url}
    ${chrome_options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${chrome_options}    add_argument    disable-extensions
    Call Method    ${chrome options}   add_argument    start-maximized
    Create Webdriver    Chrome    chrome_extension_disabled    chrome_options=${chrome_options}  executable_path=${CURDIR}\\..\\drivers\\chromedriver.exe
    Go To    ${url}

Open Firefox Browser
    [Arguments]    ${url}
    Create Webdriver    Firefox    executable_path=${CURDIR}\\..\\drivers\\geckodriver.exe
    Go To    ${url}

Close Browser Window
    Close Browser

Delete Sikuli Logs and Captured Images
    run  ${CURDIR}/../scripts/deleteSikuliLogsAndImages.bat
#    Start process  deleteSikuliLogsAndImages.bat  shell=yes  cwd=${CURDIR}/../scripts/


