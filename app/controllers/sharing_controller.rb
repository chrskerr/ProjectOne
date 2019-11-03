class SharingController < ApplicationController
  def edit
    @folder = Folder.find_by params[:id]
  end

  def update
  end

end
