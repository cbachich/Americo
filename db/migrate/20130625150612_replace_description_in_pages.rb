class ReplaceDescriptionInPages < ActiveRecord::Migration
  def up
    remove_column :descriptions, :page_id
    add_column :pages, :short_description, :string
    add_column :pages, :description, :text
    add_column :pages, :subtitle, :string
  end

  def down
    add_column :descriptions, :page_id, :integer
    remove_column :pages, :short_description
    remove_column :pages, :description
    remove_column :pages, :subtitle
  end
end
