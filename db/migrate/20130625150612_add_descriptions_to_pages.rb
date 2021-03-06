class AddDescriptionsToPages < ActiveRecord::Migration
  def up
    add_column :pages, :short_description, :string
    add_column :pages, :description, :text
    add_column :pages, :subtitle, :string
  end

  def down
    remove_column :pages, :short_description
    remove_column :pages, :description
    remove_column :pages, :subtitle
  end
end
