Feature: Login to TorrentHub
  Users should be able to log in to torrent hub so that their torrents are tied to their user
    
  Scenario: Logging in to Torrent Hub
    Given login page
    When Mattis clicks Login
    Then the page Torrent Portal is shown