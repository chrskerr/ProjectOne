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

    # broadcast a message to everyone that a new message has been received, and the info that the receiver function needs to determine what happens next.
    ActionCable.server.broadcast 'chat', {
      title: "Message from #{@current_user.name}", 
      message: message.message, 
      sender: @current_user, 
      recipient: message.to_user, 
      time: message.created_at.strftime('%a %e %b %y, %I:%M %P'), 
      link: "/chats/#{@current_user.id}", 
      key: message.id
    }

    # the form no longer refreshes the page, instead the below clears the value from the input field and then fires the JS function to insert new message
    render :js => "$('#message-input').val('') && newChatDisplay('outgoing', '#{message.message}', '#{message.created_at.strftime('%a %e %b %y, %I:%M %P')}');"
   
  end

  private
  def chat_params
    params.require(:chat).permit(:message, :to_user)
  end
end