class UsersController < DashboardController
  
  before_filter       :user, :except => [:activation]
  before_filter       :is_active_user, :except => [:show, :activation]
  skip_before_filter  :is_admin, :except => [:index, :new, :create]
  
  def user
    @user = User.find_by_permalink(params[:permalink])
  end
  
  # Account activation.
  def activation
  @user = User.find_by_activation_code(params[:id]) 
    if @user and @user.activated_at == nil and @user.activate
      flash[:notice] = "Your account has been activated #{@user.permalink}."
      redirect_to login_path()
    else
      redirect_to signup_page_path()
      flash[:notice] = "looks like you have already activated or there was no code"
    end
  end

  # user requested updated password
  def update_password
    @account = Account.find(active)

    respond_to do |format|
      if @account.update_attributes(params[:account])
           PostOffice.deliver_account_updated_details(@account)
        flash[:notice] = "Password updated"
        format.html { redirect_to(account_url(active)) }
        format.xml  { head :ok }
        else
        redirect_to account_url(active)
        flash[:error] = "Something went wrong!"
      end
    end  
  end  

  # GET /users
  # GET /users.xml
  def index
    @users = User.all
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @user }
    end
  end

  # GET /users/1
  # GET /users/1.xml
  def show
    @user = User.find_by permalink: 'mike'#(params[:permalink])
    #@user = User.find_by_permalink(params[:permalink])
    #@subscription = Spreedly::Subscriber.find(id=@user.id)

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @user }
    end
  end

  # GET /users/new
  # GET /users/new.xml
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find_by_permalink(params[:permalink])
  end

  # POST /users
  # POST /users.xml
  def create
    @user = User.new(params[:user])
    @user.profile = Profile.new(params[:profile])
    @user.style = Style.new(params[:style])
    random = User.generate_random_password(8)
    @user.password = random

    respond_to do |format|
      if @user.save
        #ExpressPostOffice.deliver_user_new(@user)
        flash[:notice] = 'User was successfully created.'
        format.html { redirect_to(@user) }
        format.xml  { render :xml => @user, :status => :created, :location => @user }
        format.js
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.xml
  def update
    @user = User.find_by_permalink(params[:permalink])
    respond_to do |format|
      if @active.update_attributes(params[:user])
        flash[:notice] = 'User was successfully updated.'
       # ExpressPostOffice.deliver_user_updated_details(@user)
        format.html { redirect_to permalink_path(@active) }
        format.xml  { head :ok }
      else
        format.html { redirect_to :back }
        format.xml  { render :xml => @post.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.xml
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to(users_url) }
      format.xml  { head :ok }
    end
  end

end