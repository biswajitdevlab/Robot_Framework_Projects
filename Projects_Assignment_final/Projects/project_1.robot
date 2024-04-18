*** Settings ***
Library     SeleniumLibrary
*** Variables ***
${browser}=  chrome
${url}=     https://www.parasoft.com/contact/
${title}=   Contact Us | Parasoft
${email}=   name:email
${fname}=   name:firstname
${lname}=   name:lastname
${company}=  name:company
${job_title}=  name:jobtitle
${phone}=   name:phone
${comments}=  name:comments
${country}=  name:country
*** Test Cases ***
Project_1
    Open Browser    ${url}  ${browser}
    Maximize Browser Window
    Click Link    link:Accept
    Sleep    3
    Title Should Be    ${Title}
    Log To Console    ${Title}
    InCorrect_Log_Details
    Correct_Log_Details
    Close Browser
* Keywords *
InCorrect_Log_Details
    Set Selenium Implicit Wait    10
    Input Text    ${email}    test
    sleep    3
    Input Text    ${fname}    Haris
    Capture Page Screenshot   Wrong_details.png
    Input Text    ${lname}    Gupta
    Input Text    ${company}    XYZ
    Input Text    ${job_title}    Engineer
    Input Text    ${phone}     7847574874
    Input Text    ${comments}    No Any
    Select From List By Index    ${country}  77
    Execute Javascript  window.scrollBy(0,500)
    sleep   3
    #Execute Javascript   document.evaluate('//input[@type='submit']',document.body,null,9,null).singleNodeValue.click()
    Click Element    xpath://input[@type='submit'][@value='Contact Us']
Correct_Log_Details
    Set Selenium Implicit Wait    10
    Input Text    ${email}    test123@gmail.com
    Input Text    ${fname}    Haris
    Input Text    ${lname}    Gupta
    Input Text    ${company}    XYZ
    Input Text    ${job_title}    Engineer
    Input Text    ${phone}     7847574874
    Input Text    ${comments}    No Any
    Select From List By Index    ${country}  77
    Sleep    3
    Execute Javascript  window.scrollBy(0,500)
    Click Element    xpath://input[@type='submit'][@value='Contact Us']
    Capture Page Screenshot   Correct_details.png