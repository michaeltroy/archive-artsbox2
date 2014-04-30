module UserConcern
  extend ActiveSupport::Concern
  
  def after_create(user)
    UserMailer.deliver_user_new(user)
  end

  def after_save(user)
    ExpressPostOffice.deliver_user_activation(user) if user.recently_activated?
  end  
  
end