# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_zhangzhe_session',
  :secret      => '96254c7f40712d7e561e1dc8198199e1b2b2f1f3f1f2862fb653532064c37874c0d5b65f4fa70aa2c19f04a31aa63b532d2501e40ee6287e76a29d191bd1e30e'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
