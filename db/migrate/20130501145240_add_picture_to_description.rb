class AddPictureToDescription < ActiveRecord::Migration
  def change
    add_column :descriptions, :picture_id, :integer
  end
end
