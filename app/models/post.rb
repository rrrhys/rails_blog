class Post < ActiveRecord::Base
	include ApplicationHelper
  belongs_to :user
  attr_accessible :content, :title, :urltext

  before_save :check_url_text


  def check_url_text
  	logger.debug "URL text was #{self.urltext}"
  	#self.urltext = self.urltext.gsub!(/[.]/i,'').gsub(/[^-a-z\d]/i,'_')
  	logger.debug "Now is #{self.urltext}"
  end 
end
