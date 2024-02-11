*** Settings ***
Library    Browser
Resource    keywords.robot

*** Variables ***
${browser}    chromium
${headless}   False
${context}    viewport={'width': 1920, 'height': 1080}

*** Keywords ***
${context} =    New Context    viewport={'width': 1920, 'height': 1080}    recordHar=${har}

*** Test Cases ***
# This test case tests that the browser is loading a page and asserts the page Title.
Go To Bol
    New Browser    chromium    headless=false
    New Context    ${context}
    New Page       url=https://www.bol.com
    Click          id=js-first-screen-accept-all-button    left
    Get Title        contains  De winkel van ons allemaal

Navigate To Basket
# This test case accepts all cookies, then language choice and navigates to the basket.
    New Browser    chromium    headless=false
    New Context    viewport={'width': 1920, 'height': 1080}
    New Page       url=https://www.bol.com
    Click          id=js-first-screen-accept-all-button    left
    Wait For Elements State     css=.ui-btn
    Click        css=.ui-btn
    Wait For Elements State        id=basket
    Click              id=basket

Add Product To Basket
# This test case searches and adds a product to the basket. Last step is screenshotted to ..\results\browser\screenshot
    New Browser    chromium    headless=false
    New Context    viewport={'width': 1920, 'height': 1080}
    New Page       url=https://www.bol.com
    Click          id=js-first-screen-accept-all-button    left
    Wait For Elements State     css=.ui-btn
    Click        css=.ui-btn
    Wait For Elements State    id=searchfor
    Fill Text      id=searchfor    babyfoon
    Click     //button[@type='submit']
    Wait For Elements State    //*[@id="9200000053342577"]
    Click   //*[@id="9200000053342577"]
  #  Take Screenshot

Invalid Login
    New Browser    chromium    headless=false
    New Context    viewport={'width': 1920, 'height': 1080}
    New Page       url=https://www.bol.com
    Click          id=js-first-screen-accept-all-button    left
    Wait For Elements State     css=.ui-btn
    Click        css=.ui-btn
  #  Wait For Elements State     css=.account-button
  #  Click        css=.account-button
  #  Fill Text      id="react-aria-1"    wrong_name@mail.com
  #  Fill Text      id="react-aria-5"    wrong_pass
  #  Click          css=button.c-cTzGPd

Navigate To Baby Room Furniture
    New Browser    chromium    headless=false
    New Context    viewport={'width': 1920, 'height': 1080}
    New Page       url=https://www.bol.com
    Click          id=js-first-screen-accept-all-button    left
    Wait For Elements State     css=.ui-btn
    Click        css=.ui-btn

   # Click      css=.dropdown-menu-item   # Pregnant, Baby & Toddler > Baby Room & Sleep > Baby Room Furniture

Filter Dutch-Language E-books
    New Browser    chromium    headless=false
    New Context    viewport={'width': 1920, 'height': 1080}
    New Page       url=https://www.bol.com
    Wait For Elements State     css=.ui-btn
    Click        css=.ui-btn

   # Click          id=js-first-screen-accept-all-button    left
   # Click          css=.filter-link    Dutch-Language

Check Footer Links Href Attribute
    New Browser    chromium    headless=false
    New Context    viewport={'width': 1920, 'height': 1080}
    New Page       url=https://www.bol.com
    Click          id=js-first-screen-accept-all-button    left
    Wait For Elements State     css=.ui-btn
    Click        css=.ui-btn
    ${ref}=    Get Element    <footer>
    Get Property    ${ref}    innerText    ==    Footer
New Page   ${LOGIN_URL}
${ref}=    Get Element    h1
Get Property    ${ref}    innerText    ==    Login Page
Evaluate JavaScript    ${ref}    (elem) => elem.innerText = "abc"
Get Property    ${ref}    innerText    ==    abc

    # Take Screenshot
    # Get Page Source
    # Pause execution
    # Get Element States    id=yourelement    contains    visible

