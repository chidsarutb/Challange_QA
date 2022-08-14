*** Settings ***
Resource    Keywords.robot
Test Setup       Open with Browsers    https://abhigyank.github.io/To-Do-List/    chrome
Test Teardown    Close Browser

*** Test Cases ***
Verify add item until complete
    Input text add itme        1234
    Click add item
    Click tab to-do task
    Verify added itme    1    1234
    Click check box to-do task    1
    Click tab completed
    Verify tasks complete    1    1234

Verify add item and delete to-do tasks
    Input text add itme        1234
    Click add item
    Click tab to-do task
    Verify added itme    1    1234
    Click delete added itme in to-do task    1
    Click tab completed
    Verify complete no tasks

Verify add item and delete complete tasks
    Input text add itme        1234
    Click add item
    Click tab to-do task
    Verify added itme    1    1234
    Click check box to-do task    1
    Click tab completed
    Verify tasks complete    1    1234
    Click delete in complete tab    1