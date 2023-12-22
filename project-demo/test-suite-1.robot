*** Settings ***
Library           SeleniumLibrary

*** variables ***
${BROWSER}     headlesschrome
${HOST}    http://localhost/EksanyNurFadilah_201011401067_07TPLE010_WP

${EMAIL}    eksany
${PASS-1}    Eksany123    # correct password
${PASS-2}    xxs12s2    # wrong password

${COMPANY}    Eksany Nur Fadilah
${TITLE}    [TEST] Senior Engineering manager
${LOCATION}     Singapore
${TAGS}    engineering manager software
${JOBEMAIL}    jobs@global.co
${WEBSITE}    https://global.co
${DESCRIPTION}     Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. 

*** Test Cases ***

# login
# positive test
testcase-1
    Login Success
    Close Browser    

# negative test
testcase-2
    Open Browser    ${HOST}    ${BROWSER}
    Page Should Contain Element   xpath://input[@name='username']
    input text        name:username       ${EMAIL}
    input text        name:password    ${PASS-2}
    Click Element     xpath://button[@type='submit']
    Close Browser 

# logout
testcase-3
    Login Success
    Click Element     xpath://button[@id='logout']
    Close Browser 

#show alternatif
testcase-4
    Login Success
    Wait Until Element Is Visible    xpath://a[contains(@href, 'alternatifView.php')]    timeout=10s
    Click Element     xpath://a[contains(@href, 'alternatifView.php')]
    Scroll Down Until End
    Close Browser 

# show rangking
testcase-5
    Login Success
    Wait Until Element Is Visible    xpath://a[contains(@href, 'ranking.php')]    timeout=10s
    Click Element     xpath://a[contains(@href, 'ranking.php')]
    Scroll Down Until End
    Close Browser
    

*** Keywords ***

Scroll Down Until End
    ${previous_height}=    Execute Javascript    return document.body.scrollHeight;
    FOR  ${i}    IN RANGE    10
        Execute Javascript    window.scrollTo(0, document.body.scrollHeight);
        Sleep    1s
        ${current_height}=    Execute Javascript    return document.body.scrollHeight;
        Exit For Loop If    '${current_height}' == '${previous_height}'
        ${previous_height}=    Set Variable    ${current_height}
        Sleep    2s
    END

Login Success
    Open Browser    ${HOST}    ${BROWSER}
    Page Should Contain Element   xpath://input[@name='username']
    input text        name:username       ${EMAIL}
    input text        name:password    ${PASS-1}
    Click Element     xpath://button[@type='submit']