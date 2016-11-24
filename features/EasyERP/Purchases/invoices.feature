Feature: Invoices checking

  Scenario: Invoice from order creation
    Given user goes to orders tab
    When user logs in to EasyErp
    When user click on New pricelist
    When user selects supplier
    When user clicks on "Add an item"
    When user types unit price "10"
    When user clicks Create button
    When user opens created item from the list
    When user click on editing order button
    Then verify that invoices tab is opened
    Then browser is closing

   Scenario: Invoice approving
     Given user goes to orders tab
     When user logs in to EasyErp
     When user click on New pricelist
     When user selects supplier
     When user clicks on "Add an item"
     When user types unit price "10"
     When user clicks Create button
     When user opens created item from the list
     When user click on editing order button
     Then verify that invoices tab is opened
     When user opens created item from the list
     When user clicks on edit button
     When user clicks on approve button
     Then browser is closing

   Scenario: Open invoice in Journal Entry after approving
     Given user goes to orders tab
     When user logs in to EasyErp
     When user click on New pricelist
     When user selects supplier
     When user clicks on "Add an item"
     When user types unit price "10"
     When user clicks Create button
     When user opens created item from the list
     When user click on editing order button
     Then verify that invoices tab is opened
     When user opens created item from the list
     When user clicks on edit button
     When user clicks on approve button
     When user clicks on Journal Entry button
     Then browser is closing

     Scenario: User downloads pdf version of invoice
       Given user goes to orders tab
       When user logs in to EasyErp
       When user click on New pricelist
       When user selects supplier
       When user clicks on "Add an item"
       When user types unit price "10"
       When user clicks Create button
       When user opens created item from the list
       When user click on editing order button
       Then verify that invoices tab is opened
       When user opens created item from the list
       When user clicks on edit button
       When user clicks on approve button
       When user clicks on Download button
       Then browser is closing

  Scenario: User deletes invoice
    Given user goes to orders tab
    When user logs in to EasyErp
    When user click on New pricelist
    When user selects supplier
    When user clicks on "Add an item"
    When user types unit price "10"
    When user clicks Create button
    When user opens created item from the list
    When user click on editing order button
    Then verify that invoices tab is opened
    When user checks one invoice from the list
    When user clicks delete button
    Then browser is closing

  Scenario: User edits invoice
    Given user goes to orders tab
    When user logs in to EasyErp
    When user click on New pricelist
    When user selects supplier
    When user clicks on "Add an item"
    When user types unit price "10"
    When user clicks Create button
    When user opens created item from the list
    When user click on editing order button
    Then verify that invoices tab is opened
    When user opens created item from the list
    When user clicks on edit invoice button
    When user changes invoice
    When user save changes
    Then browser is closing

  Scenario: User deletes invoice inside of it
    Given user goes to orders tab
    When user logs in to EasyErp
    When user click on New pricelist
    When user selects supplier
    When user clicks on "Add an item"
    When user types unit price "10"
    When user clicks Create button
    When user opens created item from the list
    When user click on editing order button
    Then verify that invoices tab is opened
    When user opens created item from the list
    When user one invoice
    When user click on "Delete" button
    When user accepts alert
    Then browser is closing


  Scenario: User attach file to invoice
    Given user goes to orders tab
    When user logs in to EasyErp
    When user click on New pricelist
    When user selects supplier
    When user clicks on "Add an item"
    When user types unit price "10"
    When user clicks Create button
    When user opens created item from the list
    When user click on editing order button
    Then verify that invoices tab is opened
    When user opens created item from the list
    When user attaches file
    Then browser is closing

