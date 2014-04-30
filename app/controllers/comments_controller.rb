class CommentsController < DashboardController
  
  before_filter       :user, :post
  skip_before_filter  :is_active_box
  skip_before_filter  :is_admin
  
  def user
    @user = User.find_by_permalink(params[:permalink])
  end
  
  def post
    @post = Post.find(params[:post])
  end
  
  # GET /comments
  # GET /comments.xml
  def index
    @comments = @post.comments.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @comments }
    end
  end

  # GET /comments/1
  # GET /comments/1.xml
  def show
    @comment = @post.comments.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @comment }
    end
  end

  # GET /comments/new
  # GET /comments/new.xml
  def new
  end

  # GET /comments/1/edit
  def edit
    @comment = @post.comments.find(params[:id])
  end

  # POST /comments
  # POST /comments.xml
  def create  
    @comment = @post.comments.build(params[:comment].merge(:user => active))

    respond_to do |format|
      if @comment.save
        format.html { redirect_to box_post_path(@box, @post) }
        format.xml  { render :xml => @comment, :status => :created, :location => @comment }
        format.js   { render :template => false }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @comment.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /comments/1
  # PUT /comments/1.xml
  def update
    @comment = @post.comments.find(params[:id])

    respond_to do |format|
      if @comment.update_attributes(params[:comment])
        flash[:notice] = 'Comment was successfully updated.'
        format.html { redirect_to box_post_path(@box, @comment) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @comment.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.xml
  def destroy
    @comment = @post.comments.find(params[:id])
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to box_post_path(@box, @post) }
      format.xml  { head :ok }
    end
  end
end
