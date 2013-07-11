class AddDescriptionsToSheets < ActiveRecord::Migration
  def up
    add_column :sheets, :title, :string
    add_column :sheets, :subtitle, :string
  end

  def down
    remove_column :sheets, :title
    remove_column :sheets, :subtitle
  end
end
