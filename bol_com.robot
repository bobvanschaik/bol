*** Settings ***
Library    SeleniumLibrary
Library    Browser
Library    BuiltIn
Library    Collections
Library    String
Library    RequestsLibrary
Resource   variables.resource

*** Keywords ***
Test setup
    Open Browser    ${BOL_URL}    ${BROWSER}
    Maximize Browser Window

Test teardown
    Close All Browsers

*** Test Cases ***
Open Browser And Search
    Open Browser    ${BOL_URL}    ${BROWSER}
    Input Text      id=searchfor    product_name
    Click Button    css=.search-indicator
    Capture Page Screenshot
    Close All Browsers

Navigate To Basket
    Open Available Browser    ${BOL_URL}    ${BROWSER}
    Click Link      css=.basket
    Close All Browsers

Add Product To Basket
    Open Available Browser    ${BOL_URL}    ${BROWSER}
    Input Text      id=searchfor    product_name
    Click Button    css=.search-indicator
    Click Button    css=.add-to-basket
    Close All Browsers

Invalid Login
    Open Available Browser    ${BOL_URL}    ${BROWSER}
    Input Text      id=username    wrong_name
    Input Text      id=password    wrong_pass
    Click Button    css=.login-button
    Clear Browser Cookies
    Close All Browsers

Navigate To Baby Room Furniture
    Open Available Browser    ${BOL_URL}    ${BROWSER}
    Click Link      css=.dropdown-menu-item    Pregnant, Baby & Toddler > Baby Room & Sleep > Baby Room Furniture
    Close All Browsers

Filter Dutch-Language E-books
    Open Available Browser    ${BOL_URL}/books    ${BROWSER}
    Maximize Browser Window
    Click Link      css=.filter-link    Dutch-Language
    Close All Browsers

Check Footer Links Href Attribute
    Open Available Browser    ${BOL_COM_URL}    ${BROWSER}
    Maximize Browser Window
    ${links}=    Get Web Elements    css=.footer-links a
    FOR    ${link}    IN    @{links}
        ${href}=    Get Element Attribute    ${link}    href
        Should Not Be Empty    ${href}
    END

