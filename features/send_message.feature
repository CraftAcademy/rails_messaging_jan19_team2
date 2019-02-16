Feature: User can send a message
    As a user
    In order to send emails to my friends
    I should be able to compose an email

Background: 
    Given I visit the landing page
    And The following users exist
        | name     | email                  | password      | password_confirmation |
        | Per Hegg | per_hegg@hotmail.com   | pereriksson   | pereriksson           |
        | Laura    | laura@gmail.com        | laurareale    | laurareale            |
    When I click on "Login"    
    And I am logged in as "Per Hegg"
    Given I am on the "inbox" page
        
Scenario: User can send a message [Happy Path]
    When I click on "Inbox"
    And I click on "Compose"
    Then I select "Laura" from "Recipients"
    And I fill in "Subject" with "Tjena"
    And I fill in "conversation_body" with "God dag Laura"
    And I click on "Send Message"
    Then I should see "Your message was successfully sent!"

Scenario: User can't send a message [Sad Path]
    When I click on "Inbox"
    And I click on "Compose"
    When I select "Laura" from "Recipients"
    And I fill in "Subject" with "Tjena"
    And I fill in "conversation_body" with " "
    And I click on "Send Message"
    Then I should see "Please fill in subject and message fields!"
    When I fill in "Subject" with "Tjena"
    And I fill in "conversation_body" with "God dag"
    Then I should see "Please fill in subject and message fields!"
    And I click on "Send Message"
    Then I should see "Please select a recipient!"