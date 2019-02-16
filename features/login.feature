Feature: User can login
    As a user
    In order to access my account
    I should be able to login

Background:
    Given I visit the landing page
    And The following users exist
        | name     | email                  | password      | password_confirmation |
        | Per Hegg | per_hegg@hotmail.com   | pereriksson   | pereriksson           |
        | Laura    | laura@gmail.com        | laurareale    | laurareale            |

Scenario: User can successfully login [Happy Path]
    When I click on "Login"    
    And I fill in "Email" with "per_hegg@hotmail.com"
    And I fill in "Password" with "pereriksson"
    And I click on "Log in"
    Then I should see "Signed in successfully."

Scenario: User can't login [Sad Path]
    When I click on "Login"
    And I fill in "Email" with " "
    And I fill in "Password" with " "
    And I click on "Log in"
    Then I should see "Invalid Email or password."