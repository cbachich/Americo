class AddPageToDescription < ActiveRecord::Migration
  def change
    add_column :descriptions, :page_id, :integer
  end
end
