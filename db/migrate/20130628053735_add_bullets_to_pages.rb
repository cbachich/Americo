class AddBulletsToPages < ActiveRecord::Migration
  def up
    add_column :pages, :bullet_1, :string
    add_column :pages, :bullet_2, :string
    add_column :pages, :bullet_3, :string
  end

  def down
    remove_column :pages, :bullet_1
    remove_column :pages, :bullet_2
    remove_column :pages, :bullet_3
  end
end
