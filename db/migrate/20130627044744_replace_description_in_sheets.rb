class ReplaceDescriptionInSheets < ActiveRecord::Migration
  def up
    remove_column :descriptions, :sheet_id
    add_column :sheets, :title, :string
    add_column :sheets, :subtitle, :string
  end

  def down
    add_column :descriptions, :sheet_id, :integer
    remove_column :sheets, :title
    remove_column :sheets, :subtitle
  end
end
