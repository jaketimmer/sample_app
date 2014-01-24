# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
# '87da1c67ad499dd372c17ac9ecd5bc8cc1217f07fcf00a53249a34bb668d83215829e1d9d0d6c9013e6f97f35a7dedd23dd6e24735a7216a692a4662562bcfdb'
require 'securerandom'


def secure_token
token_file = Rails.root .join ('.secret')
  if File.exist? (token_file   )
  	#use the existing token
  	File.read ( token_file    ).chomp
  else 
  	# Generate new token and store it in token_file
  	token = SecureRandom.hex(64)
  	File.write  (token_file  , token)
  	token
  end
end

SampleApp::Application.config.secret_key_base = secure_token
