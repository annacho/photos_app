class CommentsController < ApplicationController

  # GET /comments
  def index
    @comments = Comment.all
  end

  # GET /comments/1
  def show
    @comment = Comment.find(params[:id])
  end

  # GET /comments/new
  def new
    @new_comment = Comment.new
  end

  # GET /comments/1/edit
  def edit
    @comment = Comment.find(params[:id])
  end

  # POST /comments
  def create
    @new_comment = Comment.new(comment_params)
    if @new_comment.save
      redirect_to comments_path 
    else
      redirect_to new_comment_path
    end
  end

  # PATCH/PUT /comments/1
  def update
    @comment = Comment.find(params[:id])
    if @comment.update_attributes(comment_params)
      redirect_to comment_path(@comment)
    end 
  end

  # DELETE /comments/1
  def destroy
    @comment = Comment.find(params[:id])
    if @comment.destroy
      redirect_to comments_path
    else
      redirect_to comment_path(@comment)
    end
  end

  def filter
    @comments = Comment.search(params[:filter])
  end

  def search
    @comments = Comment.search(params[:search])
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def comment_params
    params.require(:comment).permit!
  end

end
