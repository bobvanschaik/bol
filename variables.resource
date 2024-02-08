*** Variables ***

${BROWSER}    chrome
${URL}        https://www.bol.com
${PageTitle}  De winkel van ons allemaal | bol.com
${DELAY}      0
# Test data
${FIRST_NAME}    Jan
${LAST_NAME}    Maas    
${FULL_NAME}    Huub Maas
${EMAIL}    jan.maas@example.com
${PASSWORD}    password123
${SPECIAL_COMMENT}    1-9 :; ⟨ ⟩, / / â, ê, î, ô, û, ŵ, ŷ, ä, ë, ï, ö, ü, ẅ, ÿ, á, é, í, ó, ú, ẃ, ý, à, è, ì, ò, ù, ẁ, ỳ

# Locators
${SEARCH_BAR}     id=searchfor
${SEARCH_INDICATOR}  css=.search-indicator
${BASKET}       css=.basket
${ADD_TO_BASKET}     css=.add-to-basket
${USERNAME_FIELD}    id=username
${PASSWORD_FIELD}    id=password
${LOGIN_BUTTON}      css=.login-button
${DROPDOWN_ITEM}     css=.dropdown-menu-item
${FILTER_LINK}       css=.filter-link
${FOOTER_LINKS}      css=.footer-links a
