class TagsController < ApplicationController
  before_action :set_tag, only: [:show, :edit, :update, :destroy]

  # GET /tags
  # GET /tags.json
  def index
    @tags = Tag.all
  end

  # GET /tags/1
  # GET /tags/1.json
  def show
  end

  # GET /tags/new
  def new
    @tag = Tag.new
    #This creates a new object that has the class template called Tag. @tag is a brand new object. If we want to save this to the db, we use @tag.save
    @tag.blog_id = params[:blog_id]
    #Gets blog_id attribute and pushes the blog id into the tag.new table. This associates the blog id to the tag. Gets the blog id from the AR.
  end

  # GET /tags/1/edit
  def edit
  end

  # POST /tags
  # POST /tags.json
  def create
    @tag = Tag.new(tag_params)
    @tag.title = @tag.title.downcase

  tag_entries = params[:tag_title]    
  tag_entries_array = tag_entries.split(',')

    respond_to do |format|
      if @tag.save
        format.html { redirect_to blog_path(@tag.blog_id), notice: 'Tag was successfully created.' }
      #redirect_to takes you to a new path
      #Change redirect_to @tag to redirect_to blog_path(@tag.blog_id) to redirect to the specific show blog page with the associated blog id. Use rake routes to find the path.
        format.json { render action: 'show', status: :created, location: @tag }
      else
        format.html { render action: 'new' }
        format.json { render json: @tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tags/1
  # PATCH/PUT /tags/1.json
  def update
    respond_to do |format|
      if @tag.update(tag_params)
        format.html { redirect_to @tag, notice: 'Tag was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tags/1
  # DELETE /tags/1.json
  def destroy
    temp_blog_id = @tag.blog_id
    #cache the blog id assoc w/ the tag before destroying
    #You can also use blog_id here. The script in the () below has to match. Instead of (@tag.blog_id) or (@tag.temp_blog_id), use (temp_blog_id)
    @tag.destroy
    respond_to do |format|
      format.html { redirect_to edit_blog_path(temp_blog_id) }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tag
      @tag = Tag.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tag_params
      params.require(:tag).permit(:title, :blog_id)
    end
end
