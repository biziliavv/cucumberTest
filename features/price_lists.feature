Feature: Price list checking


  Scenario: Correct create new price lists checking
    Given user opens pricelists tab
    When user types "yana.gusti"
    When user types password "thinkmobiles2015"
    When user choose db as "sergey"
    When user clicks on sign_in button
    When user minimize left menu
    When user click on New pricelist
    When user fill in to pricelist name "testname"
    When user fill in to pricelist code "code123"
    When user chooses "Yes" in supplier cost section
    When user changes currency to "UAH"
    When user clicks on create button

  Scenario: Empty creation form
    Given user opens pricelists tab
    When user types "yana.gusti"
    When user types password "thinkmobiles2015"
    When user choose db as "sergey"
    When user clicks on sign_in button
    When user minimize left menu
    When user click on New pricelist
    When user clicks on create button
    Then error about empty fields appears

  Scenario: Empty price list code
    Given user opens pricelists tab
    When user types "yana.gusti"
    When user types password "thinkmobiles2015"
    When user choose db as "sergey"
    When user clicks on sign_in button
    When user minimize left menu
    When user click on New pricelist
    When user fill in to pricelist name "testname"
    When user clicks on create button
    Then error about empty price list code appears

  Scenario: Removing one price list
    Given user opens pricelists tab
    When user types "yana.gusti"
    When user types password "thinkmobiles2015"
    When user choose db as "sergey"
    When user clicks on sign_in button
    When user one pricelist
    When user click on "Delete" button
    When user accepts alert
    Then verify that list is empty


  Scenario: Removing all price lists
    Given user opens pricelists tab
    When user types "yana.gusti"
    When user types password "thinkmobiles2015"
    When user choose db as "sergey"
    When user clicks on sign_in button
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

    Scenario: Delete inside of price list
      Given user opens pricelists tab
      When user types "yana.gusti"
      When user types password "thinkmobiles2015"
      When user choose db as "sergey"
      When user clicks on sign_in button
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
      Then verify that list is empty

