Feature: Product

  Scenario: User updates the product
    Given user opens Products tab
    When user logs in to EasyErp
    When user opens the product for editing
    When user sorts the products on left menu


  Scenario: User creates Demo product for bundle
    Given user opens Products tab
    When user logs in to EasyErp
    When user clicks on New button to create new product
    When user enters Product name "Demo Product"
    When user uploads the picture
    When user checks all checkboxes
    When user selects categories
    When user clicks Create button

  Scenario: User updates the product
    Given user opens Products tab
    When user logs in to EasyErp
    When user opens the product for editing
    When user edits product info "Test product edited"
    When user goes to Stock and Inventory tab
    When user enters stock data "9999"
    When user goes to Prices tab
    When user enters prices for 1st price list "1234"
    When user saves the edited product
    Then user checks if all data were edited and saved successfully

  Scenario: Create new product
    Given user opens Products tab
    When user logs in to EasyErp
    When user clicks on New button to create new product
    When user enters Product name "Test product name"
    When user checks all checkboxes
    When user selects categories
    When user enters product information "Test data"
    When user goes to Stock and Inventory tab
    When user enters stock data "1000"
    When user goes to Bundle tab
    When user searches for product "IT services"
    When user selects product for bundle
    When user enters number of products for bundle "10"
    When user removes product for bundle
    When user goes to Prices tab
    When user enters prices for 1st price list "100"
    When user clicks Create button
    Then new product is created

  Scenario: User deletes the product
    Given user opens Products tab
    When user logs in to EasyErp
    When user checks the product
    When user clicks delete button
    When user checks all products
    When user deletes all checked products

  Scenario: User creates new category
    Given user opens Products tab
    When user logs in to EasyErp
    When user clicks grid icon
    When user opens New category dialog "Test category"
    When user goes to Accounting Settings tab
    When user selects Accounting Settings
    When user clicks on Create button to create new category


