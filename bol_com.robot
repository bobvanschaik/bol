*** Settings ***
Library    Browser
Resource   variables.resource
Resource   keywords.resource

*** Test Cases ***
# assert that you're on the page
Starting a browser with a page
    New Browser      Chromium      headless=False
    New Context    viewport={'width': 1920, 'height': 1080}
    New Page       url=https://www.bol.com
# accepts all cookies 
    Click          id=js-first-screen-accept-all-button    left
# asserts page Title
    Get Title        contains  De winkel van ons allemaal
    Close Browser    CURRENT

Navigate To Basket
    New Browser    chromium    headless=false
    New Context    viewport={'width': 1920, 'height': 1080}
    New Page       url=https://www.bol.com
    Click          id=js-first-screen-accept-all-button    left
    Wait For Elements State     css=.ui-btn
    Click        css=.ui-btn
    Get Title        contains  De winkel van ons allemaal
# accepts all cookies then language
    Wait For Elements State        id=basket
    Click              id=basket
    Close Browser    CURRENT

Add Product To Basket
    New Browser    chromium    headless=false
    New Context    viewport={'width': 1920, 'height': 1080}
    New Page       url=https://www.bol.com
    Click          id=js-first-screen-accept-all-button    left
    Wait For Elements State     css=.ui-btn
    Click        css=.ui-btn
    Click      css=.basket
    Fill Text      id=searchfor    baby
    Take Screenshot
    # Click            css=.search-indicator
    # Click            css=.add-to-basket
    Close Browser    CURRENT

Invalid Login
    New Browser    chromium    headless=false
    New Context    viewport={'width': 1920, 'height': 1080}
    New Page       url=https://www.bol.com
    Click          id=js-first-screen-accept-all-button    left

    Fill Text      id=username    wrong_name
    Fill Text      id=password    wrong_pass
    Click            css=.login-button
    Close Browser    CURRENT

Navigate To Baby Room Furniture
    New Browser    chromium    headless=false
    New Context    viewport={'width': 1920, 'height': 1080}
    New Page       url=https://www.bol.com
    Click          id=js-first-screen-accept-all-button    left
    Click      css=.dropdown-menu-item   # Pregnant, Baby & Toddler > Baby Room & Sleep > Baby Room Furniture
    Close Browser    CURRENT

Filter Dutch-Language E-books
    New Browser    chromium    headless=false
    New Context    viewport={'width': 1920, 'height': 1080}
    New Page       url=https://www.bol.com
    Click          id=js-first-screen-accept-all-button    left
    Click          css=.filter-link    Dutch-Language
    Close Browser    CURRENT

Check Footer Links Href Attribute
    New Browser    chromium    headless=false
    New Context    viewport={'width': 1920, 'height': 1080}
    New Page       url=https://www.bol.com
    Click          id=js-first-screen-accept-all-button    left
    ${links}=    Get Web Elements    css=.footer-links a
    FOR    ${link}    IN    @{links}
        ${href}=    Get Element Attribute    ${link}    href
        Should Not Be Empty    ${href}
    END

