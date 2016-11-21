Feature: Orders

  Scenario: User creates new order
    Given user goes to orders tab
    When user logs in to EasyErp
    When user minimize left menu
    When user click on New pricelist
    When user selects supplier
    When user clicks on "Add an item"
    When user types unit price "10"
    When user clicks Create button