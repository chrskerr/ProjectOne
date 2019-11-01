class CreateFoldersUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :folders_users, :id => false do |t|
      t.integer :folder_id
      t.integer :user_id
    end
  end
end
