Feature: Producs tab

  Scenario: User creates new product

    Given user opens testdemo site
    When user enters "yana.gusti"
    When user enters password "thinkmobiles2015"
    When user choose db
    When user clicks sign_in button
    When user clicks on New button
    When user enters Product name "Test product name"
    When user checks all checkboxes
    When user selects categories
    When user enters product information "Test data"
    When user goes to Stock and Inventory tab
    When user enters stock data "1000"
    When user goes to Bundle tab
    When user searches for product "Demo Product"
    When user selects product for bundle
    When user enters number of products for bundle "10"
    When user removes product for bundle
    When user goes to Prices tab
    When user enters prices for 1st price list "100"
    When user goes to the next Price list tab
    When user enters prices for 2nd price list "200"
    When user clicks Create button
    Then new product is created
