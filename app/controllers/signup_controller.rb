class SignupController < ApplicationController
  
  layout "signup"
    
  def signup
    @environment = "BLAH BLAH"
    
    @user = User.new(params[:user])
    @style = Style.new(params[:style])
  end
  
  def new_user
    @user = User.new(params[:user])
    @user.account = Account.new(params[:account])
    @user.style = Style.new(params[:style])
    random = User.generate_random_password(8)
    @user.password = random

    respond_to do |format|
      if @user.save
        format.html { redirect_to login_path, flash[:notice] = "Your account was sucessfully created." }
        format.xml  { render :xml => @user, :status => :created, :location => @user }
        format.js   { render :partial => "new_account_success" }
      else
        #format.html { redirect_to :back }
        #format.xml  { render :xml => @account.errors, :status => :unprocessable_entity }
        format.js   { render :partial => "new_account_errors" }
      end
    end
  end

end