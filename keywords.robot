*** Settings ***
Library   Browser

*** Keywords ***
Open Maximized Browser
    [Arguments]    ${browser}
    New Browser    browser=${browser}    headless=false   args=["--start-maximized"]
    New Context    viewport=${None}

Open Browser to bol
    [Arguments]    ${url}
    New Page       ${url}
    Click          id=js-first-screen-accept-all-button    left
