@javascript

Feature: User authorization

  User authorize on main page using his email and password

  Scenario: User enters valid credentials into login form and authorize
    Given I am a guest
    When I enter valid credentials and click log in button
    Then I should be logged in
    And redirected to profile page

  Scenario: User enters invalid credentials into login form and see error messages
    Given I am a guest
    When I enter invalid credentials and click log in button
    Then I should see authorization error messages
    And stay on the same page