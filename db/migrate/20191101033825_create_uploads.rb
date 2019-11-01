class CreateUploads < ActiveRecord::Migration[6.0]
  def change
    create_table :uploads do |t|
      t.string :name
      t.string :attachment
      t.integer :folder_id

      t.timestamps
    end
  end
end
