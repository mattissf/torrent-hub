Feature: Login to TorrentHub
  In order to have a personalized portal of torrents
  Users should be able to log in with their username
  So that each users list of torrents is shown
  
  Scenario: Logging in with wrong password
    Given I am on login page
    And user "Mattis" with password "1234"
    When I fill in "username" with "Mattis"
    And I fill in "password" with "1235"
    And I press "Login"
    Then I should be on login page
    And I should see "Wrong username or password"
    
  Scenario: Logging in with a valid user
    Given I am on login page
    And user "Mattis" with password "1234"
    When I fill in "username" with "Mattis"
    And I fill in "password" with "1234"
    And I press "Login"
    Then I should be on the portal    