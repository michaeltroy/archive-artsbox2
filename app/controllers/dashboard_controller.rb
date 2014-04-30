class DashboardController < ApplicationController
  
  # Find which user.
  before_filter :is_active_user, :load_side_panel
  
  # find active account
  def is_active_user
    
    if @active
    elsif active
       redirect_to account_path(active)
       flash[:error] = "Oops, that's not your account!"
    else
       redirect_to login_path()
       flash[:error] = "Oops, you need to login first!"
    end
  end
  
  # Load the side panel.
  def load_side_panel
    @latest_posts = Post.latest_posts
    @latest_users = User.latest_users
  end
  
end