class AddTitleAndDetailsToPictures < ActiveRecord::Migration
  def up
    add_column :pictures, :title, :string
    add_column :pictures, :details, :text
  end

  def down
    remove_column :pictures, :title
    remove_column :pictures, :details
  end
end
