*** Settings ***
Library    Browser
Library    BuiltIn
Library    Collections
Library    String
Library    RequestsLibrary
Resource   variables.resource

*** Test Cases ***
Starting a browser with a page
    New Browser    chromium    headless=false
    New Context    viewport={'width': 1920, 'height': 1080}
    New Page       ${URL}
    Get Url        contains id="js-first-screen-accept-all-button"
    Click          id="js-first-screen-accept-all-button"
    Get Url        contains ${PageTitle}

Navigate To Basket
    New Browser    chromium    headless=false
    New Context    viewport={'width': 1920, 'height': 1080}
    New Page       ${URL}
    Click      css=.basket

Add Product To Basket
    New Browser    chromium    headless=false
    New Context    viewport={'width': 1920, 'height': 1080}
    New Page       ${URL}
    Fill Text      id=searchfor    baby
    Click            css=.search-indicator
    Click            css=.add-to-basket

Invalid Login
    New Page    ${URL}    ${BROWSER}
    Fill Text      id=username    wrong_name
    Fill Text      id=password    wrong_pass
    Click Button    css=.login-button
    Close Browser    CURRENT        # Closes all browsers

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

