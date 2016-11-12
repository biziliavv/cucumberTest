Feature: Products tab

  Scenario: User deletes the product

    Given user opens products list
    When user enters login "yana.gusti"
    When user enters pass "thinkmobiles2015"
    When user selects db "sergey"
    When user clicks signin button
    When user checks the product
    When user clicks delete button
    When user checks all products
    When user deletes all checked products

