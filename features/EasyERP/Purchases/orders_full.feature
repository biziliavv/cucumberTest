Feature: Orders

  Scenario: User sorts purchase orders list
    Given user goes to orders tab
    When user logs in to EasyErp
    When user sorts purchase orders list

  Scenario: User creates new order
    Given user goes to orders tab
    When user logs in to EasyErp
    When user opens New Order dialog
    When user enters all new order information

  Scenario: User creates the prepayment for the order
    Given user goes to orders tab
    When user logs in to EasyErp
    When user opens order details page
    When user creates prepayment for the order
    When user checks if the prepayment was done correctly

  Scenario: User switches for different number of orders in left menu
    Given user goes to orders tab
    When user logs in to EasyErp
    When user opens order details page
    When user switches for different number of orders in left menu

  Scenario: User sorts purchase orders in left menu
    Given user goes to orders tab
    When user logs in to EasyErp
    When user opens order details page
    When user sorts purchase orders in left menu

  Scenario: User downloads pdf file for order
    Given user goes to orders tab
    When user logs in to EasyErp
    When user opens order details page
    When user downloads pdf for order

  Scenario: User adds a comment to order
    Given user goes to orders tab
    When user logs in to EasyErp
    When user opens order details page
    When user adds and removes the comment to purchase order

  Scenario: User edits the order
    Given user goes to orders tab
    When user logs in to EasyErp
    When user opens order details page
    When user opens order for editing
    When user changes the order details
    When user opens order for editing
    Then user checks if edited order details were saved successfully

