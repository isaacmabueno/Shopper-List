class User < ActiveRecord::Base
#what happens when we enable has_secure_password
#ActiveRecord looks for an 'email' column as well as a 'password_digest' column
#and works with the...to auto setup BCrypt and salt/hash for us!
  has_secure_password
end
