class ReplaceDescriptionInPictures < ActiveRecord::Migration
  def up
    remove_column :descriptions, :picture_id
    add_column :pictures, :title, :string
    add_column :pictures, :details, :text
  end

  def down
    add_column :descriptions, :picture_id, :integer
    remove_column :pictures, :title
    remove_column :pictures, :details
  end
end
