class User < ApplicationRecord
  has_one :restaurant
  has_secure_password

  def self.sign_up(email, password)
    create(email: email, password: password, auth_token: SecureRandom.hex)
  end

end
