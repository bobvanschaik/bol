*** Settings ***
Library   Browser

*** Variables ***
${browser}        Chromium
${headless}   False
${context}    viewport={'width': 1920, 'height': 1080}
${url}            https://www.bol.com/
${acceptallcookies}    id=js-first-screen-accept-all-button
${cookies_btn}    id=js-first-screen-accept-all-button
${language_btn}    css=.ui-btn
# ${login_btn}
${email}    jan.maas@example.com
${username}    Jan Man
${password}    password123
# ${search_bar}     id=searchfor
# ${basket}       id=basket
# ${add_to_basket}     //button[@type='submit']
# ${email_field}
# ${password_field}
# ${filter_link}
# ${footer_links}
# ${test-comment}    z19 :; ⟨ ⟩, / / â, ê, î, ô, û, ŵ, ŷ, ä, ë, ï, ö, ü, ẅ, ÿ, á, é, í, ó, ú, ẃ, ý, à, è, ì, ò, ù, ẁ, ỳ
