*** Settings ***
Library    Browser
Library    BuiltIn
Library    Collections
Library    String
Library    RequestsLibrary
Resource   variables.resource
Resource   keywords.resource

*** Test Cases ***
Starting a browser with a page
    New Browser    chromium    headless=false
    New Context    viewport={'width': 1920, 'height': 1080}
    New Page       url    https://www.bol.com
    Wait For Response
    Get Url        contains id="js-first-screen-accept-all-button"
    Click          id="js-first-screen-accept-all-button"
    Get Url        contains ${PageTitle}

Navigate To Basket
    New Browser    chromium    headless=false
    New Context    viewport={'width': 1920, 'height': 1080}
    New Page       url
    Click      css=.basket
    Close Browser    CURRENT

Add Product To Basket
    New Browser    chromium    headless=false
    New Context    viewport={'width': 1920, 'height': 1080}
    New Page       url
    Fill Text      id=searchfor    baby
    Click            css=.search-indicator
    Click            css=.add-to-basket
    Close Browser    CURRENT

Invalid Login
    New Browser    chromium    headless=false
    New Context    viewport={'width': 1920, 'height': 1080}
    New Page        ${URL}    ${BROWSER}
    Fill Text      id=username    wrong_name
    Fill Text      id=password    wrong_pass
    Click            css=.login-button
    Close Browser    CURRENT

Navigate To Baby Room Furniture
    New Browser    chromium    headless=false
    New Context    viewport={'width': 1920, 'height': 1080}
    New Page    ${URL}    ${BROWSER}
    Click      css=.dropdown-menu-item   # Pregnant, Baby & Toddler > Baby Room & Sleep > Baby Room Furniture
    Close Browser    CURRENT

Filter Dutch-Language E-books
    New Browser    chromium    headless=false
    New Context    viewport={'width': 1920, 'height': 1080}
    New Page        ${URL}    ${BROWSER}
    Click          css=.filter-link    Dutch-Language
    Close Browser    CURRENT

Check Footer Links Href Attribute
    New Browser    chromium    headless=false
    New Context    viewport={'width': 1920, 'height': 1080}
    New Page        ${URL}    ${BROWSER}
    ${links}=    Get Web Elements    css=.footer-links a
    FOR    ${link}    IN    @{links}
        ${href}=    Get Element Attribute    ${link}    href
        Should Not Be Empty    ${href}
    END

