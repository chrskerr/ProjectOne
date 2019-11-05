class LiveChatChannel < ApplicationCable::Channel
  def subscribed
    stream_from "live_chat_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
