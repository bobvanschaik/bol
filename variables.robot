*** Settings ***
Library   Browser

*** Variables ***
${browser}        Chromium
${url}            https://www.bol.com/
${acceptallcookies}    id=js-first-screen-accept-all-button
${login_btn}
${email}    jan.maas@example.com
${username}    Jan Man
${password}    password123
${email}    jan.man@example.com

${SEARCH_BAR}     id=searchfor
${SEARCH_INDICATOR}  css=.search-indicator
${BASKET}       id=basket
${ADD_TO_BASKET}     css=.add-to-basket
${USERNAME_FIELD}    id=username
${PASSWORD_FIELD}    id=password
${DROPDOWN_ITEM}     css=.dropdown-menu-item
${FILTER_LINK}       css=.filter-link
${FOOTER_LINKS}      css=.footer-links a

# Test data
${diakrieten-comment}    19 :; ⟨ ⟩, / / â, ê, î, ô, û, ŵ, ŷ, ä, ë, ï, ö, ü, ẅ, ÿ, á, é, í, ó, ú, ẃ, ý, à, è, ì, ò, ù, ẁ, ỳ
