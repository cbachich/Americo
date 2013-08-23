class RemoveBulletsFromPages < ActiveRecord::Migration
  def up
    remove_column :pages, :bullet_1
    remove_column :pages, :bullet_2
    remove_column :pages, :bullet_3
  end

  def down
    add_column :pages, :bullet_3, :string
    add_column :pages, :bullet_2, :string
    add_column :pages, :bullet_1, :string
  end
end
