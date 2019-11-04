class ChatsController < ApplicationController
  before_action :check_for_login

  def index
  end

  def show
    @from = User.find params[:id]
  end

  def new
  end
end
