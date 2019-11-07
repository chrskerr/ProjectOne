class ChatChannel < ApplicationCable::Channel
  def subscribed
    stream_from "chat"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end


  def mark_read data

    # called when a message is viewed as it is sent, so is trigged by the chat.js ActionController data-received trigger
    # used to prevent weird unread messages while in an active chat, since the page isn't reloading which isn't causing a re-read of seen messages
    
    puts data['id']
    message = Chat.find data['id']
    message.seen = true
    message.save

  end

end
