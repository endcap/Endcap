Feature: Manage Users And Sessions
  In order to use the app
  As an user
  I want to create and manage an account
  
  Scenario: Signup
    Given I am not logged in
    And I follow "Signup"
    And I fill in "first_name" with "Ashley"
    And I fill in "last_name" with "Williams"
    And I fill in "email" with "ashley.williams@email.com"
    And I fill in "password" with "1234"
    And I fill in "password_confirmation" with "1234"
    And I press "Submit"
    Then I should see "Welcome!"
  
  Scenario: Login
    Given I am not logged in
    And I have a user named "Ashley Williams"
    And I follow "Login"
    And I fill in "email" with "ashley.williams@email.com"
    And I fill in "password" with "1234"
    And I press "Login"
    Then I should see "Hello!"