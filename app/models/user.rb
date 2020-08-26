class User < ActiveRecord::Base
  validates :name, presence: true
  validates :password_confirmation, presence: true
  validates :password, presence: true
  validates :email, presence: true

  has_secure_password

  def self.authenticate_with_credentials(email, password)
    
    
    user = User.find_by_email(email)
    
    # If the user exists AND the password entered is correct.
    if user && user.authenticate(password)
      # Save the user id inside the browser cookie. This is how we keep the user 
      # logged in when they navigate around our website.
      return true
    end
    return false
  end
  
end
