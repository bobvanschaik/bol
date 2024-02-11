*** Settings ***
Library    Browser
Suite Setup    New Browser    browser=${browser}    headless=${headless}
Test Setup    New Context
Test Teardown    Close Context
Suite Teardown    Close Browser

*** Variables ***
${browser}    chromium
${headless}   False
${context}    viewport={'width': 1920, 'height': 1080}
${cookies_btn}    id=js-first-screen-accept-all-button
${language_btn}    css=.ui-btn
# ${login_btn}
${email}    jan.maas@example.com
${username}    Jan Man
${password}    password123
${email}    jan.man@example.com

*** Keywords ***
Open Bol Homepage
    New Page    url=https://www.bol.com
    Click          id=js-first-screen-accept-all-button    left
    Wait For Elements State     css=.ui-btn
    Click        css=.ui-btn

# Enter User Data
# [Arguments]    ${firstname}=Jan    ${password}=Man
#  Fill Text    id=firstname    Jan
#  Fill Text    id=password    Man

*** Test Cases ***
# This test case tests that the browser is loading a page and asserts the page Title.
Go To Bol
    Open Bol Homepage
    Get Title        contains  De winkel van ons allemaal

Navigate To Basket
# This test case accepts all cookies, then language choice and navigates to the basket.
    Open Bol Homepage
    Wait For Elements State        id=basket
    Click              id=basket

Add Product To Basket
# This test case searches and adds a product to the basket. Last step is screenshotted to ..\results\browser\screenshot
    Open Bol Homepage
    Wait For Elements State    id=searchfor
    Fill Text      id=searchfor    babyfoon
    Click     //button[@type='submit']
    Wait For Elements State    //*[@id="9200000053342577"]
    Click   //*[@id="9200000053342577"]
  #  Take Screenshot

Invalid Login
    Open Bol Homepage
  #  Wait For Elements State     css=.account-button
  #  Click        css=.account-button
  #  Fill Text      id="react-aria-1"    wrong_name@mail.com
  #  Fill Text      id="react-aria-5"    wrong_pass
  #  Click          css=button.c-cTzGPd

Navigate To Baby Room Furniture
    Open Bol Homepage
   # Click      css=.dropdown-menu-item   # Pregnant, Baby & Toddler > Baby Room & Sleep > Baby Room Furniture

Filter Dutch-Language E-books
    Open Bol Homepage

   # Click          id=js-first-screen-accept-all-button    left
   # Click          css=.filter-link    Dutch-Language

Check Footer Links Href Attribute
    Open Bol Homepage
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

