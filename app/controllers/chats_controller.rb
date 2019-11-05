class ChatsController < ApplicationController
  before_action :check_for_login

  def index
  end

  def show
    @from = User.find params[:id]
    @messages = Chat.where(from_user: [@current_user, params[:id]], to_user: [@current_user, params[:id]]).order(:created_at)
  end

  def new
  end
end
