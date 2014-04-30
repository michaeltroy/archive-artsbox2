# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  
  # Is the user admin?
  def is_admin
    if session[:user_id]
      @active.role == "admin"
    else session = nil 
    end
  end
  
  # Is this the active user?
  def active_user
    if session[:user_id]
      @active == @user || @active.role == "admin"
    else session = nil 
    end 
  end
  
  # Yes or no. For newsletter mailout.
  def yes_no(bool)
    if bool == true
      "yes"
    else
      "no"
    end
  end
  
  # Current friend?
  def current_friend
    Friendship.exists?(['user_id = ? and friend_id = ?', @active.id, @user.id])
  end
  
end
