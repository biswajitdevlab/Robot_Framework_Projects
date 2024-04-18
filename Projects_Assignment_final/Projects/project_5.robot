*** Settings ***
Library      RequestsLibrary
Library      Collections
*** Variables ***
${url}=  https://reqres.in
*** Test Cases ***
Get Requests
      [Tags]  Testing
      ${response}=    GET  https://reqres.in/api/users/2
      log to console   ${response.status_code}
      Should Be Equal As Strings      ${response.reason}  OK
      Status Should Be        200  ${response}
Post Requests
      [Tags]   Testing
      ${req_body}=  Create Dictionary   name=Jiban   job=Engineer
      Post      ${url}/api/users   json=${req_body}     expected_status=201
      Log To Console    ${req_body}
Put Requests
      [Tags]  Testing
      Create Session  Session1   ${url}   disable_warnings=1
      ${endpoint}     Set Variable    api/users/2
      ${body}=    Create Dictionary   name=Virat  job=Wrestler
      ${response}     PUT On Session  Session1    ${endpoint}     data=${body}
      Log To Console    ${response.status_code}
      Log To Console    ${response.content}
      #validations
      ${status_code}=     Convert To String    ${response.status_code}
      should be equal    ${status_code}   200

Delete Requests
      [Tags]  Testing
      Create Session  Session1   ${url}   disable_warnings=1
      ${endpoint}     Set Variable    api/users/2
      ${response}     Delete On Session  Session1    ${endpoint}
      Log To Console    ${response.status_code}
      Log To Console    ${response.content}
      #validations
      ${status_code}=     Convert To String    ${response.status_code}
      should be equal    ${status_code}   204