class AddSheetToPage < ActiveRecord::Migration
  def change
    add_column :pages, :sheet_id, :integer
  end
end
