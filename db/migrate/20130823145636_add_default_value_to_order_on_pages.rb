class AddDefaultValueToOrderOnPages < ActiveRecord::Migration
  def up
    change_column :pages, :order, :integer, :default => 0
  end

  def down
    change_column :pages, :order, :integer, :default => nil
  end
end
