class CreatePicattachments < ActiveRecord::Migration
  def change
    create_table :picattachments do |t|
      t.string :picture
      t.integer :micropost_id

    end
    add_index :picattachments, [:micropost_id]
  end
end
