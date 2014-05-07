class PhotosController < ApplicationController

  # GET /photos
  def index
    @photos = Photo.all
  end

  # GET /photos/1
  def show
    @photo = Photo.find(params[:id])
    @new_comment = @photo.comments.build
  end

  # GET /photos/new
  def new
    @new_photo = Photo.new
  end

  # GET /photos/1/edit
  def edit
    @photo = Photo.find(params[:id])
  end

  # POST /photos
  def create
    @new_photo = Photo.new(photo_params)
    if @new_photo.save
      redirect_to photos_path 
    else
      redirect_to new_photo_path
    end
  end

  # PATCH/PUT /photos/1
  def update
    @photo = Photo.find(params[:id])
    if @photo.update_attributes(photo_params)
      redirect_to photo_path(@photo)
    end 
  end

  # DELETE /photos/1
  def destroy
    @photo = Photo.find(params[:id])
    if @photo.destroy
      redirect_to photos_path
    else
      redirect_to photo_path(@photo)
    end
  end

  def filter
    @photos = Photo.search(params[:filter])
  end

  def search
    @photos = Photo.search(params[:search])
  end

  def upload_file
    @photo = Photo.find(params[:id])
    upload_file = @photo.image
    send_file upload_file.path
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def photo_params
    params.require(:photo).permit!
  end

end
