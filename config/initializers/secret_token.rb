# Be sure to restart your server when you modify this file.

# Your secret key for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!
# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
def secure_token
  token_file = Rails.root.join('.secret')
  if File.exist?(token_file)
    # Use the existing token.
    File.read(token_file).chomp
  else
    # Generate a new token and store it in token_file.
    token = SecureRandom.hex(64)
    File.write(token_file, token)
    token
  end
end

MapleBacon::Application.config.secret_token = secure_token

MapleBacon::Application.config.secret_key_base = 'c3db063ce474aee39401fbf5ad218af0cb3c6ed0ac42e364f6aaef961b0412be8aa096eaf161854209a79d81556f549874117b7a22f1f6b03e21c9e6ea3b5734'