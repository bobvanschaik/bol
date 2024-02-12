*** Settings ***
Library    Browser
Resource    variables.resource
Suite Setup    New Browser    browser=${browser}    headless=${headless}
Test Setup    New Context
Test Teardown    Close Context
Suite Teardown    Close Browser

*** Keywords ***
Open Bol Homepage
    New Page    url=https://www.bol.com
    Click          id=js-first-screen-accept-all-button    left
    Wait For Elements State     css=.ui-btn
    Click        css=.ui-btn

Assert Title Homepage
    Get Title        contains  De winkel van ons allemaal

Click On Basket
    Wait For Elements State        id=basket
    Click              id=basket

# Enter User Data
# [Arguments]    ${email}=Jan    ${password}=Man
#  Fill Text    id="react-aria-1"    jan.man@example.com
#  Fill Text    id="react-aria-5"   password123

*** Test Cases ***
Navigate To Bol
    Open Bol Homepage
    Assert Title Homepage

Navigate To Basket
# This test case accepts all cookies, then language choice and navigates to the basket.
    Open Bol Homepage
    Click On Basket

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
    Click        text="Inloggen"
  #  Fill Text      id="react-aria-1"    wrong_name@mail.com
  #  Fill Text      id="react-aria-5"    wrong_pass
  #  Click          css=button.c-cTzGPd

Navigate To Baby Room Furniture
# via hover navigate to https://www.bol.com/nl/nl/l/babykamermeubels/44542/
# Pregnant, Baby & Toddler > Baby Room & Sleep > Baby Room Furniture    
    Open Bol Homepage
    Hover      text=Categorieën
    Hover      

Filter Dutch-Language E-books
# https://www.bol.com/nl/nl/l/ebooks/
    Open Bol Homepage




Check Footer Links Href Attribute
    Open Bol Homepage
    ${ref}=    Get Element    //*[@id="__next"]/div/footer"]
    Get Property    ${ref}    innerText    ==    Footer
    Evaluate JavaScript    ${ref}    (elem) => elem.innerText = "Footer"

    # Take Screenshot
    # Get Page Source
    # Pause execution
    # Get Element States    id=yourelement    contains    visible

