*** Settings ***
Library    Browser
Resource   variables.resource
Resource   keywords.resource

*** Test Cases ***
[Documentation] This test case tests that the browser is loading a page and asserts the page Title.
Starting a browser with a page
    New Browser      Chromium      headless=False
    New Context    viewport={'width': 1920, 'height': 1080}
    New Page       url=https://www.bol.com
    Click          id=js-first-screen-accept-all-button    left
    Get Title        contains  De winkel van ons allemaal
    Close Browser    CURRENT

Navigate To Basket
[Documentation] This test case accepts all cookies, then language check and navigates to the basket.
    New Browser    chromium    headless=false
    New Context    viewport={'width': 1920, 'height': 1080}
    New Page       url=https://www.bol.com
    Click          id=js-first-screen-accept-all-button    left
    Wait For Elements State     css=.ui-btn
    Click        css=.ui-btn
    Get Title        contains  De winkel van ons allemaal
    Wait For Elements State        id=basket
    Click              id=basket
    Close Browser    CURRENT

Add Product To Basket
[Documentation] This test case searches and adds a product to the basket.
    New Browser    chromium    headless=false
    New Context    viewport={'width': 1920, 'height': 1080}
    New Page       url=https://www.bol.com
    Click          id=js-first-screen-accept-all-button    left
    Wait For Elements State     css=.ui-btn
    Click        css=.ui-btn
    Wait For Elements State    id=searchfor
    Fill Text      id=searchfor    babyfoon
    Press Keys     xpath=//button[@class=“wsp-search__btn” and contains(text(),‘Zoeken’)]     Enter
    Wait For Elements State    id=9200000053342577
    Click   id=9200000053342577
    Take Screenshot
    Get Page Source
    Pause execution
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

    # Take Screenshot
    # Get Page Source
    # Pause execution
