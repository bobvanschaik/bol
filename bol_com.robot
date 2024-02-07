*** Settings ***
Library    SeleniumLibrary
Library    Browser
Resource    variables.resource

*** Test Cases ***
Has Title
    New Page    https://bol.com/
    Get Title    contains    bol

Product Search
    Open Available Browser    ${BOL_URL}    chrome
    Maximize Browser Window
    Input Text      id=searchfor    product_name
    Click Button    css=.search-indicator
    Capture Page Screenshot
    Close All Browsers

Navigate To Basket
    Open Available Browser    ${BOL_URL}    chrome
    Maximize Browser Window
    Click Link      css=.basket
    Close All Browsers

Add Product To Basket
    Open Available Browser    ${BOL_URL}    chrome
    Maximize Browser Window
    Input Text      id=searchfor    product_name
    Click Button    css=.search-indicator
    Click Button    css=.add-to-basket
    Close All Browsers

Login With Wrong Credentials
    Open Available Browser    ${BOL_URL}    chrome
    Maximize Browser Window
    Input Text      id=username    wrong_name
    Input Text      id=password    wrong_pass
    Click Button    css=.login-button
    Clear Browser Cookies
    Close All Browsers

Navigate To Baby Room Furniture
    Open Available Browser    ${BOL_URL}    chrome
    Maximize Browser Window
    Click Link      css=.dropdown-menu-item    Pregnant, Baby & Toddler > Baby Room & Sleep > Baby Room Furniture
    Close All Browsers

Filter Dutch-Language E-books
    Open Available Browser    ${BOL_URL}/books    chrome
    Maximize Browser Window
    Click Link      css=.filter-link    Dutch-Language
    Close All Browsers

Check Footer Links Href Attribute
    Open Available Browser    ${BOL_COM_URL}    chrome
    Maximize Browser Window
    ${links}=    Get Web Elements    css=.footer-links a
    FOR    ${link}    IN    @{links}
        ${href}=    Get Element Attribute    ${link}    href
        Should Not Be Empty    ${href}
    END
    Close All Browsers

# This is a code comment. Optional is to test with Page Should Contain Element
