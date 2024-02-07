*** Keywords ***

Open Browser
    Open Browser    ${BOL_URL}    ${BROWSER}

Test setup
    Open Browser    ${BOL_URL}    ${BROWSER}
    Maximize Browser Window

Test teardown
    Close All Browsers
