# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_freshdesk_sso_session',
  :secret      => 'b2c067f18b0750f6ba1aaac50aff090607a7a166bfe5036904d51df511c9b2db831c41a50938cbcfac57224a229e5b15c41541b07b967a862a4fba94c59b2038'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
