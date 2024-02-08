*** Settings ***
Library    Browser
Library    BuiltIn
Library    Collections
Library    String
Library    RequestsLibrary
Resource   variables.resource
Test Setup  New Page
Test Teardown   Exit Browser

*** Test Cases ***
Starting a browser with a page
    New Browser    chromium    headless=false
    New Context    viewport={'width': 1920, 'height': 1080}
    New Page       ${URL}
    Get Title      ==    Browser

Navigate To Basket
    New Page    ${URL}    ${BROWSER}
    Click Link      css=.basket
    Close All Browsers

Add Product To Basket
    New Page    ${URL}    ${BROWSER}
    Fill Text      id=searchfor    product_name
    Click Button    css=.search-indicator
    Click Button    css=.add-to-basket
    Close All Browsers

Invalid Login
    New Page    ${URL}    ${BROWSER}
    Fill Text      id=username    wrong_name
    Fill Text      id=password    wrong_pass
    Click Button    css=.login-button
    Clear Browser Cookies
    Close All Browsers

Navigate To Baby Room Furniture
    New Page    ${URL}    ${BROWSER}
    Click Link      css=.dropdown-menu-item    Pregnant, Baby & Toddler > Baby Room & Sleep > Baby Room Furniture
    Close All Browsers

Filter Dutch-Language E-books
    New Page    ${URL}/books    ${BROWSER}
    Maximize Browser Window
    Click Link      css=.filter-link    Dutch-Language
    Close All Browsers

Check Footer Links Href Attribute
    New Page    ${URL}    ${BROWSER}
    Maximize Browser Window
    ${links}=    Get Web Elements    css=.footer-links a
    FOR    ${link}    IN    @{links}
        ${href}=    Get Element Attribute    ${link}    href
        Should Not Be Empty    ${href}
    END

