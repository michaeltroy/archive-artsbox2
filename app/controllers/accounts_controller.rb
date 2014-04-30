class AccountsController < DashboardController
  
  before_filter   :user, :is_active_user
  before_filter   :is_admin, :only => [:index, :new, :create]
  
  # Get users permalink
  def user
    @user = User.find_by_permalink(params[:permalink])
  end

  # GET /accounts
  # GET /accounts.xml
  def index
    @accounts = Account.find(:all)
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @accounts }
    end
  end

  # GET /accounts/1
  # GET /accounts/1.xml
  # GET /account/:permalink
  def show    
    @account = @active.account
    #@subscription = Spreedly::Subscriber.find(id=@account.id)

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @account }
    end
  end

  # GET /accounts/new
  # GET /accounts/new.xml
  def new    
    @account = Account.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @account }
    end
  end

  # GET /accounts/1/edit
  def edit
    @account = @active.account
  end

  # POST /accounts
  # POST /accounts.xml
  def create
  end

  # PUT /accounts/1
  # PUT /accounts/1.xml
  def update
    @account = @active.account

    respond_to do |format|
      if @account.update_attributes(params[:account])
        flash[:notice] = 'Account was successfully updated.'
       # ExpressPostOffice.deliver_account_updated_details(@account)
        format.html { redirect_to(@account) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  # DELETE /accounts/1
  # DELETE /accounts/1.xml
  def destroy
    @account = @active
    @account.destroy

    respond_to do |format|
      format.html { redirect_to(accounts_url) }
      format.xml  { head :ok }
    end
  end
  
end