class User < ActiveRecord::Base
  attr_accessible :email, :is_administrator, :name, :password, :password_confirmation
  has_secure_password
  before_validation :not_administrator
  before_save :create_remember_token
  validates :is_administrator, :inclusion => {:in => [true, false]}
  validates_presence_of :email
  validates_presence_of :name
  validates_presence_of :password
  validates_presence_of :password_confirmation

  def not_administrator
  	if not self.is_administrator?
  		self.is_administrator = 0
  	end
  end
  def create_remember_token
  	if not self.remember_token?
  		self.remember_token = SecureRandom.urlsafe_base64
  	end
  end

end
