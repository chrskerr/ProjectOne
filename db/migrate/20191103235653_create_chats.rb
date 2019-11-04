class CreateChats < ActiveRecord::Migration[6.0]
  def change
    create_table :chats do |t|
      t.integer :from_user
      t.integer :to_user
      t.boolean :seen
      t.text :message

      t.timestamps
    end
  end
end
