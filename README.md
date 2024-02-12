# bol
Robot Framework Test Suite that runs automated tests on a Dutch webshop with Browser Library syntax.
Repeating code are stored in Keywords and and values are stored Variables.

Introduction: https://robotframework-browser.org/

Keyword documentation: https://marketsquare.github.io/robotframework-browser/Browser.html

Robotcode extension for VScode: https://marketplace.visualstudio.com/items?itemName=d-biehl.robotcode


Tip: follow the installation instructions at the Library Browser github pages, since that will install the latest version as a dependency: https://github.com/MarketSquare/robotframework-browser/
README https://github.com/MarketSquare/robotframework-browser/blob/main/README.md


**Prerequisites and Install**

Browser Library installation requires both Python and NodeJs.

Plain Robot Framework installation

``` 
pip install robotframework
``` 

Install Browser library from PyPi with pip:

``` 
pip install robotframework-browser
```

Initialize the Browser library:

``` 
rfbrowser init
```

Install library when browsers binaries are installed separately to non standard location.

Install Browser library from PyPi with pip:

``` 
pip install robotframework-browser
```

Initialize the Browser library and skip browsers installation:

```
rfbrowser init --skip-browsers
```

Install browser binaries separately according Playwright instructions. Example:

``` 
PLAYWRIGHT_BROWSERS_PATH=$HOME/pw-browsers npx playwright install
```

Run test with PLAYWRIGHT_BROWSERS_PATH set. Example:

```
PLAYWRIGHT_BROWSERS_PATH=$HOME/pw-browsers robot path/to/test
```
