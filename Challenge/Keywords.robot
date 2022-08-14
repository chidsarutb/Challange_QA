*** Settings ***
Resource    Settings.robot

*** Keywords ***
Open with Browsers
    [Arguments]    ${url}    ${browsers}
    Open Browser     ${url}     ${browsers}

Input text add itme
    [Arguments]    ${txt_add_item}
    Input Text     //*[@id="new-task"]    ${txt_add_item}

Click add item
    Click Element     //*[@id="add-item"]/button

Verify added itme
    [Arguments]    ${get_added_item}    ${added_item}
    Wait Until Element Is Visible       //*[@id="text-${get_added_item}"]
    ${get_added_item}    Get Text       //*[@id="text-${get_added_item}"]
    Should Be Equal    ${get_added_item}    ${added_item}

Click tab to-do task
    Click Element     //a[contains(.,'To-Do Tasks')]

Click delete added itme in to-do task
    [Arguments]    ${delete_number}
    Click Element    //button[@id="${delete_number}"]
    Wait Until Element Is Not Visible        //button[@id="${delete_number}"]    
Click check box to-do task
    [Arguments]    ${number_check_box}
    Click Element     //*[@id="text-${number_check_box}"]

Click tab completed
    Click Element     //a[contains(.,'Completed')]

Verify tasks complete
    [Arguments]    ${number_item_complete}    ${get_item_complete}
    Wait Until Element Is Visible       //*[@id="completed"]//span[text()='${get_item_complete}']
    ${get_added_item}    Get Text       //*[@id="completed-tasks"]/li[@class="mdl-list"][${number_item_complete}]/span
    ${get_added_item}    	Remove String	${get_added_item}    done
    log     ${get_added_item}
    Should Be Equal    ${get_added_item}    ${get_item_complete}

Verify complete no tasks
    Element Should Not Be Visible     //div[@id="completed"]//button[contains(.,DELETE)]

Click delete in complete tab
    [Arguments]    ${delete_number}
    Click Element    //button[@id="${delete_number}"]
