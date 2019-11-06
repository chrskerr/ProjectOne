class FolderChannel < ApplicationCable::Channel
  def subscribed
    stream_from "folder"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
