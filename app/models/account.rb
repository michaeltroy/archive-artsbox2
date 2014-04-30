class Account < ActiveRecord::Base
  
  has_one :user
  
  def to_param
   self.user.permalink
  end
  
end