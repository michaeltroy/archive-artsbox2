class HomeController < ApplicationController
  
  def index
    new_images = Image.find(:all, :limit => 6, :order => 'created_at DESC')
    new_posts = Post.find(:all, :limit => 4, :order => 'created_at DESC')
    new_comments = Comment.find(:all, :limit => 4, :order => 'created_at DESC')
    @activity = (new_images + new_posts + new_comments).sort_by(&:created_at).reverse
    signup
  end
  
  def signup
    @user = User.new(params[:user])
    @style = Style.new(params[:style])
  end
  
   def new_user
     @user = Box.new(params[:user])
     @user.style = Style.new(params[:style])
     random = Account.generate_random_password(8)
     @account.password = random

     respond_to do |format|
       if @user.save
         #@subscriber = Spreedly::Subscriber.create!(id=@account.id, email=@account.email, screen_name=@account.email)
         #@subscriber.activate_free_trial(plan_id='1335')
         ExpressPostOffice.deliver_user_new(@user)
         format.html { redirect_to "/" }
         format.xml  { render :xml => @user, :status => :created, :location => @user }
         format.js   { render :template => false }
       else
         format.html { redirect_to "/" }
         format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
         format.js   { render :partial => "new_user_errors", 
                              :message => @errors.to_json }
       end
     end
   end
   
   def new_user_errors
    @errors = @user.errors
   end
    
end