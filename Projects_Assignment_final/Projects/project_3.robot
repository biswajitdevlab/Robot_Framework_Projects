*** Settings ***
Library     SeleniumLibrary
*** Variables ***
${url}=  https://demowebshop.tricentis.com
${browser}=  chrome
*** Test Cases ***
Demo_Web_Shop
     Set Selenium Implicit Wait    10
     Open Browser    ${url}  ${browser}
     Maximize Browser Window
     Click Link     Register
     Click Element    xpath://div[@class='center-2']//form
     Input Text    id:FirstName    Biswas
     Input Text    id:LastName    Nayak
     Input Text    id:Email    biswas14@gmail.com
     Input Text    id:Password    biswas25
     Input Text    id:ConfirmPassword    biswas25
     Click Element    id:register-button
     Click Element    xpath://a[@class='ico-logout']
     logintest
     additemtocart
     Step_1
     Step_2
     Step_3
     Step_4
     Step_5
     Step_6
     welcome_page
     Capture Page Screenshot     Thank_You.png
     Close Browser
*** Keywords ***
Login_Test
     Click Element    link:Log in
     Input Text    id:Email    biswas14@gmail.com
     Input Text    id:Password    biswas25
     Click Element    xpath://input[@value='Log in']
     Sleep    5
Add_Item_To_Cart
     Execute Javascript  window.scrollTo(0,1000)
     Click Element    xpath://div[@class='product-grid home-page-product-grid']//div[3]//div[1]//div[2]//div[3]//div[2]//input[1]
     Sleep    3
     Execute Javascript  window.scrollTo(0,-2000)
     Sleep    3
     Click Element    xpath://span[normalize-space()='Shopping cart']
     Sleep    2
     Click Element    id:termsofservice
     Click Element    id:checkout
Step_1
     [Documentation]     Billing address
     Wait Until Element Is Visible    id:BillingNewAddress_CountryId
     Select From List By Index    id:BillingNewAddress_CountryId     2
     Input Text    id:BillingNewAddress_City    Kolkata
     Input Text    id:BillingNewAddress_Address1     New Town,Kolkata
     Input Text    id:BillingNewAddress_ZipPostalCode    765432
     Input Text    id:BillingNewAddress_PhoneNumber    8967543215
     Wait Until Element Is Enabled    id:billing-buttons-container
     Click Element    xpath://input[@onclick='Billing.save()']
Step_2
     [Documentation]     Shipping Address
      Click Element    xpath://input[@onclick='Shipping.save()']
Step_3
     [Documentation]     Shipping Method
     Click Element    xpath://input[@class='button-1 shipping-method-next-step-button']
Step_4
     [Documentation]     Payment method
     Click Element    xpath://input[@class='button-1 payment-method-next-step-button']
Step_5
     [Documentation]     Payment information
     Click Element    xpath://input[@class='button-1 payment-info-next-step-button']
Step_6
     [Documentation]     Confirm order
     Click Element    xpath://input[@value='Confirm']
Welcome_Page
     Set Selenium Implicit Wait    10
     Page Should Contain    Thank you     

