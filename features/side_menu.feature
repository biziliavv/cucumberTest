Feature: Side menu checking

  Scenario: User opens each tab from short version

    Given user opens testdemo
    When user types "yana.gusti"
    When user types password "thinkmobiles2015"
    When user choose db as "sergey"
    When user clicks on sign_in button
    When user minimize left menu
