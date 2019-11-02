class UploadsController < ApplicationController
  before_action :check_for_login
  
  def index
      @uploads = Upload.all
      @user = User.find_by :id => @current_user
      @folders = @user.folders.all 
      # raise 'hell'
  end

  def new
    @upload = Upload.new 
    @folder_array = []
    @current_user.folders.each do | f |
      @folder_array << [f.name, f.id.to_i]
    end
  end

  def create
    @upload = Upload.new upload_params
    @upload.folder_id = params[:folder_id]
    if @upload.save
      redirect_to uploads_path
    else
      render new_upload_path
    end
  end

  def destroy
    @upload = Upload.find params[:id]
    @upload.destroy
    redirect_to root_path
  end

  private
  def upload_params
    params.require(:upload).permit(:name, :attachment, :folder_id)
  end
end
