Feature: Products tab

  Scenario: User deletes the product

    Given user opens products list page
    When user types login "yana.gusti"
    When user types pass "thinkmobiles2015"
    When user selects db from dropdown
    When user clicks on signin button
    When user clicks grid icon
    When user opens New category dialog "Test category"
    When user goes to Accounting Settings tab
    When user selects Accounting Settings
    When user clicks on Create button