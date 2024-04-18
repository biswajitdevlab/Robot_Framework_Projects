*** Settings ***
Library    SeleniumLibrary
*** Variables ***
${url}=     http://demo.seleniumeasy.com/input-form-demo.html
${browser}=     chrome
*** Keywords ***
open my browser
     Open Browser   ${url}      ${browser}
     Maximize Browser Window
open login page
      Go To    ${url}
enter first name
     [Arguments]  ${first_name}
      Input Text      name:first_name      ${first_name}
enter last name
      [Arguments]  ${last_name}
      Input Text    name:last_name      ${last_name}
enter email
       [Arguments]  ${email}
       Input Text    name: email      ${email}
enter phone
       [Arguments]  ${phone}
       Input Text       name:phone             ${phone}
enter address
       [Arguments]  ${address}
       Input Text         name:address         ${address}
enter city
       [Arguments]  ${city}
       Input Text      name:city     ${city}
enter state
       [Arguments]  ${state}
      Select From List By Label    name:state       ${state}
enter zip
       [Arguments]  ${zip}
      Input Text      name:zip   ${zip}
enter website
       Input Text    name:website    www.xyz.com
click the element
       Click Element      xpath://input[@value='yes']
enter comment
       Input Text    comment    please complete it before eod
       Wait Until Element Is Enabled    xpath://button[@type='submit'][@class='btn btn-default']
click submit
       Click Element    xpath://button[@type='submit'][@class='btn btn-default']
close my browser
       Close All Browsers