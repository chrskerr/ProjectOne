class MakeSeenDefaultFalseInChats < ActiveRecord::Migration[6.0]
  def change
    change_column :chats, :seen, :boolean, :default => false
  end
end
