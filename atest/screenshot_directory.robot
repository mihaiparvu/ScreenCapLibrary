*** Settings ***
Suite Setup    Clean Temp Files And Create Directory
Test Setup     Save Start Time
Test Teardown  Clean Temp Files
Resource       resources/common.robot

*** Variables ***
${SCREENSHOT DIR} =     ${CURDIR}${/}robot_atest_screenshots
${BASENAME} =           ${SCREENSHOT DIR}${/}screenshot
${FIRST_SCREENSHOT} =   ${BASENAME}_1.png

*** Test Cases ***
Set Screenshot Directory
    ${old} =                 ScreenCapLibrary.Set Screenshot Directory  ${SCREENSHOT DIR}
    Paths Should Be Equal    ${OUTPUT DIR}             ${old}
    ScreenCapLibrary.Take Screenshot
    Screenshot Should Exist  ${FIRST SCREENSHOT}

*** Keywords ***
Clean Temp Files And Create Directory
    Clean Temp Files
    Create Directory    ${SCREENSHOT DIR}

Clean Temp Files
    Remove Files  ${OUTPUTDIR}/*.png
    Remove Directory    ${SCREENSHOT DIR}    recursive=True

Paths Should Be Equal
    [Arguments]    ${p1}    ${p2}
    ${path 1}      Normalize Path   ${p1}
    ${path 2}      Normalize Path   ${p2}
    Should Be Equal    ${path1}     ${path2}
