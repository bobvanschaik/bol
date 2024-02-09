*** Settings ***
Library    Browser
Resource    keywords.robot
Resource    variables.robot

*** Test Cases ***
# This test case tests that the browser is loading a page and asserts the page Title.
Starting a browser with a page
    New Browser    browser=${browser}      headless=False    args=["--start-maximized"]
    New Context    viewport=${None}
    New Page       ${url}
    Click          id=js-first-screen-accept-all-button    left
    Get Title        contains  De winkel van ons allemaal

Navigate To Basket
# This test case accepts all cookies, then language check and navigates to the basket.
    New Browser    chromium    headless=false
    New Context    viewport={'width': 1920, 'height': 1080}
    New Page       url=https://www.bol.com
    Click          id=js-first-screen-accept-all-button    left
    Wait For Elements State     css=.ui-btn
    Click        css=.ui-btn
    Get Title        contains  De winkel van ons allemaal
    Wait For Elements State        id=basket
    Click              id=basket

Add Product To Basket
# This test case searches and adds a product to the basket. Last step is screenshotted to directory\results\browser\screenshot
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
    Get Element    text=Inloggen

    Pause execution
    Fill Text      id=username    wrong_name
    Fill Text      id=password    wrong_pass
    Click            css=.login-button

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

 # ${links}=    Get Web Elements    css=.footer-links a
 # FOR    ${link}    IN    @{links}
 # ${href}=    Get Element Attribute    ${link}    href
 # Should Not Be Empty    ${href}
 # END

    # Take Screenshot
    # Get Page Source
    # Pause execution
