*** Settings ***
Library   Browser

*** Keywords ***
${defaultcontext} =    New Context    viewport={'width': 1920, 'height': 1080}    recordHar=${har}
