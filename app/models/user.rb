class User < ActiveRecord::Base

  has_secure_password

  validates :name, presence: true
  validates :email, presence: true
  validates :email, :uniqueness => { :case_sensitive => false }
  validates :password, presence: true, length: { minimum: 3 }
  validates :password_confirmation, presence: true, length: { minimum: 3 }
  
  def self.authenticate_with_credentials(email, password)
    user = where('LOWER(email) = ?', email.downcase.delete(' '))[0]
    user && user.authenticate(password)
  end
  # OR:
  # def self.authenticate_with_credentials(email, password)
  #   user = User.find_by_email(email.strip.downcase)
  #   # If user exists and password is correct
  #   if user && user.authenticate(password)
  #     user
  #   else
  #     nil
  #   end
  # end
  
end
