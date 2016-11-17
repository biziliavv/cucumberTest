Feature: Price list checking


  Scenario: Correct create new price lists checking
    Given user opens pricelists tab
    When user logs in to EasyErp
    When user minimize left menu
    When user click on New pricelist
    When user fill in to pricelist name "testname"
    When user fill in to pricelist code "code123"
    When user chooses "Yes" in supplier cost section
    When user changes currency to "UAH"
    When user clicks on create button
    Then browser is closing

  Scenario: Empty creation form
    Given user opens pricelists tab
    When user logs in to EasyErp
    When user minimize left menu
    When user click on New pricelist
    When user clicks on create button
    Then error about empty fields appears
    Then browser is closing

  Scenario: Empty price list code
    Given user opens pricelists tab
    When user logs in to EasyErp
    When user minimize left menu
    When user click on New pricelist
    When user fill in to pricelist name "testname"
    When user clicks on create button
    Then error about empty price list code appears
    Then browser is closing

  Scenario: Removing one price list
    Given user opens pricelists tab
    When user logs in to EasyErp
    When user checks one item
    When user click on "Delete" button
    When user accepts alert
    Then verify that list is empty
    Then browser is closing


  Scenario: Removing all price lists
    Given user opens pricelists tab
    When user logs in to EasyErp
    When user click on New pricelist
    When user fill in to pricelist name "testname"
    When user fill in to pricelist code "code123"
    When user chooses "Yes" in supplier cost section
    When user changes currency to "UAH"
    When user clicks on create button
    When user checks all pricelists
    When user click on "Delete" button
    When user accepts alert
    Then verify that list is empty
    Then browser is closing

    Scenario: Delete inside of price list
      Given user opens pricelists tab
      When user logs in to EasyErp
      When user click on New pricelist
      When user fill in to pricelist name "testname"
      When user fill in to pricelist code "code123"
      When user chooses "Yes" in supplier cost section
      When user changes currency to "UAH"
      When user clicks on create button
      When user clicks on price list
      When user one pricelist
      When user click on "Delete" button
      When user accepts alert
      Then browser is closing

