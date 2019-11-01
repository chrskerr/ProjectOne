class UploadsController < ApplicationController
  def index
    @uploads = Upload.all
  end

  def new
    @upload = Upload.new 
  end

  def create
    @upload = Upload.new upload_params
    if @upload.save
      redirect_to root_path
    else
      render new_upoad_path
    end
  end

  def destroy
    @upload = Upload.find params[:id]
    @upload.destroy
    redirect_to root_path
  end

  private
  def upload_params
    params.require(:upload).permit(:name, :attachment)
  end
end
