class UploadsController < ApplicationController
  before_action :check_for_login
  
  def index
    @upload = Upload.new
    @folder2 = Folder.new
  end

  def new
    @upload = Upload.new 
  end

  def create
    @upload = Upload.new upload_params
    if @upload.save
      redirect_to uploads_path
    else
      render new_upload_path
    end
  end

  def edit
    @file = Upload.find params[:id]
  end

  def update
    file = Upload.find params[:id]    
    file.update upload_params 
    redirect_to uploads_path
  end

  def destroy
    @upload = Upload.find params[:id]
    @upload.destroy
    redirect_to uploads_path
  end

  private
  def upload_params
    params.require(:upload).permit(:name, :attachment, :folder_id)
  end
end
