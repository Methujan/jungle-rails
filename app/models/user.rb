class User < ActiveRecord::Base
  has_secure_password

  #validates :name, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, :uniqueness => {:case_sensitive => false}
  validates :password_digest, presence: true
  validates :password, length: { minimum: 6 }

  def self.authenticate_with_credentials(email, password)
    return nil if email === nil

    userEmail = email.downcase.strip
    @user = User.find_by_email(userEmail)
    @user && @user.authenticate(password) ? @user : nil
  
  end

end
