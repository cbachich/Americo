class RemoveSubtitleFromPages < ActiveRecord::Migration
  def up 
    remove_column :pages, :subtitle
  end

  def down
    add_column :pages, :subtitle, :string
  end
end
