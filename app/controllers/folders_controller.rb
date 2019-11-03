class FoldersController < ApplicationController
  def new
    @folder = Folder.new
  end

  def create
    @folder = Folder.create folder_params
    @current_user.folders << @folder
    redirect_to uploads_path
  end
  
  def edit
    @folder = Folder.find params[:id]
  end

  def update 
    folder = Folder.find params[:id]
    folder.update folder_params 
    redirect_to uploads_path
  end

  def destroy
    folder = Folder.find params[:id]
    files = folder.uploads
    files.each do | f |
      f.destroy
    end
    folder.destroy
    redirect_to uploads_path
  end

  def sharing_edit
    @folder = Folder.find params[:id]
  end

  def sharing_update
    folder = Folder.find params[:id]
    User.all.each do | user |
      if params["#{user.email}"]
        folder.users << user unless folder.users.pluck(:email).member?(user.email) 
      else
        folder.users.destroy(user.id) if folder.users.pluck(:email).member?(user.email) 
      end 
    end
    redirect_to uploads_path
  end

  private
  def folder_params
    params.require(:folder).permit(:name)
  end
end
