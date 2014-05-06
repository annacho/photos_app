class TagsController < ApplicationController

  # GET /tags
  def index
    @tags = Tag.all
  end

  # GET /tags/1
  def show
    @tag = Tag.find(params[:id])
  end

  # GET /tags/new
  def new
    @new_tag = Tag.new
  end

  # GET /tags/1/edit
  def edit
    @tag = Tag.find(params[:id])
  end

  # POST /tags
  def create
    @new_tag = Tag.new(tag_params)
    if @new_tag.save
      redirect_to tags_path 
    else
      redirect_to new_tag_path
    end
  end

  # PATCH/PUT /tags/1
  def update
    @tag = Tag.find(params[:id])
    if @tag.update_attributes(tag_params)
      redirect_to tag_path(@tag)
    end 
  end

  # DELETE /tags/1
  def destroy
    @tag = Tag.find(params[:id])
    if @tag.destroy
      redirect_to tags_path
    else
      redirect_to tag_path(@tag)
    end
  end

  def filter
    @tags = Tag.search(params[:filter])
  end

  def search
    @tags = Tag.search(params[:search])
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def tag_params
    params.require(:tag).permit!
  end

end
