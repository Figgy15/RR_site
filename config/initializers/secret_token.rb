require 'securerandom'

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

RRProject::Application.config.secret_key_base = '50ac2b3c8edef8ed94ba60684072b5564a7fe0a408923eefb2eb09d264abfe3367365353eddfebbbd673e0253040dd24997de4cc97f104954709ffbb763f86bf'
