Feature: Orders

  Scenario: User adds a comment to order
    Given user opens Orders tab
    When user logs in to EasyErp
    When user opens order details page
    When user adds and removes the comment to purchase order

  Scenario: User downloads pdf file for order
    Given user opens Orders tab
    When user logs in to EasyErp
    When user opens order details page
    When user downloads pdf for order

  Scenario: User creates new order
    Given user opens Orders tab
    When user logs in to EasyErp
    When user opens New Order dialog
    When user enters all new order information

  Scenario: User edits the order
    Given user opens Orders tab
    When user logs in to EasyErp
    When user opens order details page
    When user opens order for editing
    When user changes the order details
    When user opens order for editing
    Then user checks if edited order details were saved successfully

