class UserObserver < ActiveRecord::Observer
  
  def after_create(user)
    ExpressPostOffice.user_new(user)
  end

 def after_save(user)
    ExpressPostOffice.user_activation(user) if user.recently_activated?
 end  
  
end