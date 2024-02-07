*** Keywords ***

Test setup
    Open Browser    ${BOL_URL}    ${BROWSER}
    Maximize Browser Window

Test teardown
    Close All Browsers
