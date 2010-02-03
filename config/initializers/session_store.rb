# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_TorrentHub_session',
  :secret      => '4d7c86d2efbf13ba91a593975411c0dfba5d6141e0926c668f75aedd13031fb75df40c7b846ff4e640b359891d375e7abd28261a7f2ebb79689e2dfcfd63f33e'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
