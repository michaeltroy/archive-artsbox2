class StylesController < DashboardController
  
    before_filter   :user
    before_filter   :is_active_user 
    before_filter   :is_admin, :only => [:new, :create]

    def user
      @user = User.find_by_permalink(params[:permalink])
    end

    # GET /boxs
    # GET /boxs.xml
    def index
    end

    # GET /boxs/1
    # GET /boxs/1.xml
    def show
      @style = Style.find(params[:id])

      respond_to do |format|
        format.html
        format.css
      end    
    end

    # GET /boxs/new
    # GET /boxs/new.xml
    def new
      @style = Style.new
      
      respond_to do |format|
        format.html # new.html.erb
        format.xml  { render :xml => @style }
      end
    end

    # GET /boxs/1/edit
    def edit
      @style = Style.find(params[:id])
    end

    # POST /boxs
    # POST /boxs.xml
    def create
      @style = Style.new(params[:style])
      @style = @active.styles.build(params[:style])
      respond_to do |format|
        if @style.save
          flash[:notice] = 'Your custom styles wher saved.'
          format.html { redirect_to edit_user_style_path(@user, @style) }
          format.xml  { render :xml => @style, :status => :created, :location => @style }
        else
          format.html { render :action => "new" }
          format.xml  { render :xml => @style.errors, :status => :unprocessable_entity }
        end
      end
    end

    # PUT /boxs/1
    # PUT /boxs/1.xml
    def update
      @style = Style.find(params[:id])

      respond_to do |format|
        if @style.update_attributes(params[:style])
          flash[:notice] = 'Style was successfully updated.'
          format.html { redirect_to edit_user_style_path(@user, @style) }
          format.xml  { head :ok }
        else
          format.html { render :action => "show" }
        end
      end
    end

    # DELETE /boxs/1
    # DELETE /boxs/1.xml
    def destroy
      @style = Style.find(params[:id])
      @style.background.destroy
      if @style.background.destroy
        redirect_to edit_user_style_path(@user, @style)
      end
    end
  
end