class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :active, :all_users #, :this_environment
  
  # Find active user.
  def active()
    if session[:user_id]
      @active = User.find(session[:user_id])
      else session = nil 
    end
  end
  
  # Find all users.
  def all_users
    @users = User.all
  end
  
#  # What environment?
#  def what_environment
#    if RAILS_ENV == "devlopment"
#       "artsbox.dev"
#     elsif
#       RAILS_ENV == "staging"
#       "174.143.173.60"
#     else # must be production
#       "http://artsbox.com"
#    end   
#  end  
#  
#  def this_environment
#    @environment = what_environment
#  end

end
