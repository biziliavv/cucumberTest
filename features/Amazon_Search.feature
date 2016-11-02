Feature: Amazon Search Functionality

  Scenario: Users can search for a specific item on Amazon
    Given a user goes to Amazon
    When they enter login for "tester.bizilia@gmail.com"
    When they type password "bizilia87"
    Then amazon should return results for "Vitaliy"