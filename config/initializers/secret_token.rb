# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.

#SampleApp::Application.config.secret_key_base = '9b3fb911f0bb439609b851804709266c7e6a658d31782a6c397288978c94e1a82119027cda76e9fba7242d2f674ebc5bcdf4a10a366cc23cdead030ecc8e0e0d'

require 'securerandom'

def secure_token
  token_file = Rails.root.join('.secret')
  if File.exist?(token_file)
    # User the existing token.
    File.read(token_file).chomp
  else
    # Generate a new token and store it in token_file
    token = SecureRandom.hex(64)
    File.write(token_file, token)
  end
end

SampleApp::Application.config.secret_key_base = secure_token
