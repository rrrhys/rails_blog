class User < ActiveRecord::Base
  attr_accessible :email, :is_administrator, :name, :password, :password_confirmation
  has_secure_password
  before_validation :not_administrator
  
  
  before_save :create_remember_token
  #make sure is_administrator is set to true or false.
  validates :is_administrator, :inclusion => {:in => [true, false]}
  
  validates_format_of :email, :with => /\A[^@ ]+@[^@ ]+\.[^@ ]+\Z/
  validates_uniqueness_of :email, :case_insensitive => false
  validates_presence_of :name
  
  #only check for PW on setup.
  validates :password, :on => :create, :length => {minimum: 6}

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
