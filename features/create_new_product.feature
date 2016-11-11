Feature: Product Type menu

  Scenario: User opens product type page

    Given user opens testdemo site
    When user enters "yana.gusti"
    When user enters password "thinkmobiles2015"
    When user choose db"sergey"
    When user clicks sign_in button
    When user clicks on New button
    When user enters Product name "Test product name"
    When user checks all checkboxes
    When user selects categories
    Then new product is created
