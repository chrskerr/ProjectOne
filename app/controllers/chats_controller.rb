class ChatsController < ApplicationController
  before_action :check_for_login

  def index
  end

  def show
    @from = User.find params[:id]
    @messages = Chat.where(from_user: [@current_user, params[:id]], to_user: [@current_user, params[:id]]).order(:created_at)
    @message = Chat.new
  end

  def new
    @message = Chat.new
  end

  def create
    message = Chat.create chat_params
    message.from_user = @current_user.id
    message.save

    redirect_to chat_path(params[:chat]['to_user'])
  end

  private
  def chat_params
    params.require(:chat).permit(:message, :to_user)
  end
end
