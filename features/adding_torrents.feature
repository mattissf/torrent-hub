Feature: Adding torrents
  In order to download content from the internet
  Users should be able to add torrents to the portal
  
  Background:
    Given I am logged in
  
  @wip
  Scenario: Uploading a torrent
    Given I am on the portal
    When I press "Add Torrent"
    And I upload a torrent file
    Then I should see "Ubuntu 9.10" in the list of torrents