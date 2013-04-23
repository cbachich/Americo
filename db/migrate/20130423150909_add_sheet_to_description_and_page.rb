class AddSheetToDescriptionAndPage < ActiveRecord::Migration
  def change
    add_column :descriptions, :sheet_id, :integer
    add_column :pages, :sheet_id, :integer
  end
end
