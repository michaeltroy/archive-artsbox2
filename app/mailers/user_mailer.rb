class UserMailer < ActionMailer::Base
  #default from: "from@example.com"

  def deliver_user_new(user)
    user_email_base(user)
    @subject += "New account | Please activate your account."
  end

  def user_activation(user)
    user_email_base(user)
    @subject += "Your user has been activated"
  end
  
  # sends regenerated password
  def user_send_new_password(user)
    user_email_base(user)
    @subject += "New password" 
  end
  
  # gets sent if user updates the user model
  def user_updated_details(user)
    user_email_base(user)
    @subject += "Updated user details"
  end

  # Protected
  protected
  
  def user_email_base(user)
    @recipients  = user.email
    @from        = "test@metaset.com.au"
    @bcc         = ["test@metaset.com"]
    @subject     = "ArtsBox | "
    @sent_on     = Time.now
    #body         :user => user, :environment => @environment
  end

end
