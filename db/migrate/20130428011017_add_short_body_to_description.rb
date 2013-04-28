class AddShortBodyToDescription < ActiveRecord::Migration
  def change
    add_column :descriptions, :short_body, :string
  end
end
