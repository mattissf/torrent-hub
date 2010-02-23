Feature: Login to TorrentHub
  Users should be able to log in to torrent hub so that their torrents are tied to their user
    
  Scenario: Logging in to Torrent Hub
    Given I am on login page
    When I fill in "username" with "Mattis"
    And I fill in "password" with "1234"
    And I press "Login"
    Then I should be on the portal