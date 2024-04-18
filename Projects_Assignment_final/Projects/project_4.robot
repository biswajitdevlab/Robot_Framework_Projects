*** Settings ***
Library  SeleniumLibrary
*** Variables ***
${url}=     https://www.booking.com/
${browser}=  chrome
*** Test Cases ***
Booking_flight_tab
    Open Browser    ${url}  ${browser}
    Maximize Browser Window
    Set Browser Implicit Wait    10
    #Handle Alert    dismiss
    Click Element    xpath://*[name()='path' and contains(@d,'M13.31 12l')]
    Click Element    link:Flights
    Click Element    xpath://label[@for='search_type_option_ONEWAY']//span[@class='InputRadio-module__field___4Jbyo']
    Click Element    xpath://span[normalize-space()='1 adult']
    Click Element    xpath://div[@class='css-13o7eu2']//button[2]//span[1]//span[1]//*[name()='svg']
    Click Element    xpath://div[@id='__bui-8']//div[2]//div[1]//div[2]//button[2]//span[1]//span[1]//*[name()='svg']//*[name()='path' and contains(@d,'M20.25 11.')]
    sleep     3
    Select From List By Value   name:sr_occupancy_children_age_0   8
    Click Element    xpath://span[normalize-space()='Done']
    Click Element    xpath://div[@class='css-lgj0h8']//button[1]
    Click Element    xpath://span[@class='Icon-module__root___DweoM css-lyj9ft Icon-module__root--size-small___nolwT']//*[name()='svg']
    Input Text       xpath://input[@placeholder='Airport or city']    BLR
    Click Element    xpath://li[1]//span[1]//span[1]
    Click Element    xpath://span[@class='Icon-module__root___DweoM css-a2ri1o Icon-module__root--size-medium___NsiEM Icon-module__root--color-action___boiZs']//*[name()='svg']
    Click Element    xpath:(//button[@type='button'])[4]
    Input Text       xpath://input[@placeholder='Airport or city']    MAA
    Click Element    xpath://li[1]//span[1]//span[1]
    Click Element    xpath://button[@placeholder='Choose departure date'][@aria-haspopup='true']
    Click Element    xpath://span[@aria-label='9 July 2023']
    #Click Element    xpath://span[@aria-label='10 July 2023']
    Sleep    3
    Click Element    xpath://body[1]/div[1]/div[1]/div[1]/div[2]/div[1]/div[1]/div[1]/div[1]/div[1]/div[1]/div[2]/div[2]/div[1]/div[1]/button[1]
    Sleep    2
    Execute Javascript  window.scrollBy(0,1000)
    Click Element    xpath://label[@for='__bui-43']//span[@class='InputCheckbox-module__field___R4nYQ']
    Page Should Contain    Air India
    Close Browser