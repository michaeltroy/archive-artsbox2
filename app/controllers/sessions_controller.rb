class SessionsController < ApplicationController
  
  layout 'login'

  def create
    user = User.authenticate(params[:email], params[:password])
      
    respond_to do |format|
    if user
       session[:user_id] = user.id
       format.html { redirect_to permalink_path(active.permalink) }
       flash[:notice] = "Hey there, #{active.permalink}"
        else
       flash[:notice] = "Hey there, please login"
      end
    end
    
    #rescue if incorrect details etc
    rescue
      flash[:error] = "Oops, either your details are incorrect or your account is unverified."
      redirect_to login_path
  end
  
  def destroy
    reset_session
    redirect_to login_path
    flash[:notice] = "You have logged out"
  end
  
  def send_new_password
    if request.post?
      user = User.does_user_exist(params[:email])
      random = User.generate_random_password(8)
      if user and user.email == params[:email] && user.password = random
        if user.save!
          ExpressPostOffice.user_send_new_password(user)
          redirect_to login_path
          flash[:notice] = "Your password has been regenerated and emailed"
        end
        
      # if email address does not exist  
      else user && user.email != params[:email]
        redirect_to login_path
        flash[:error] = "Sorry, your email address is not in our system."
      end
    end
  end
  
  def resend_new_account_email
    if request.post?
      user = User.does_user_exist(params[:email])
        if user
          ExpressPostOffice.deliver_user_new(user)
          redirect_to login_path
          flash[:notice] = "We have resent your account activation email to #{user.email}"
        
      # if email address does not exist  
      else user && user.email != params[:email]
        redirect_to login_path
        flash[:error] = "Sorry, your email address is not in our system."
      end
    end
  end 
  
end