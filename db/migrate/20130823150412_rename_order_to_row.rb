class RenameOrderToRow < ActiveRecord::Migration
  def up
    rename_column :pages, :order, :row
  end

  def down
    rename_column :pages, :row, :order
  end
end
