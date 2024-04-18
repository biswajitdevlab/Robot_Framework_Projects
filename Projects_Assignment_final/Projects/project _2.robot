*** Settings ***
Library   SeleniumLibrary
Resource   ../Resources/login_resources_p2.robot
Library     DataDriver   ../TestData/Data1.xlsx     sheet_name=Sheet1
Suite Setup   open my browser
Suite Teardown    close my browser
Test Template    Login Datas
*** Test Cases ***
LoginTestwithExcel using ${first_name} and ${last_name} and ${email} and ${phone} and ${address} and ${city} and ${state} and ${zip}
*** Keywords ***
Login Datas
           [Arguments]    ${first_name}    ${last_name}    ${email}   ${phone}    ${address}    ${city}    ${state}   ${zip}
           enter first name  ${first_name}
           enter last name  ${last_name}
           enter email  ${email}
           enter phone  ${phone}
           enter address  ${address}
           enter city  ${city}
           enter state  ${state}
           enter zip  ${zip}
           enter website
           click the element
           enter comment
           click submit