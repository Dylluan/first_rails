class AddPicturesToMicroposts < ActiveRecord::Migration
  def change
    add_column :microposts, :pictures, :json
  end
end
