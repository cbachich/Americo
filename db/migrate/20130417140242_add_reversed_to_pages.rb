class AddReversedToPages < ActiveRecord::Migration
  def change
    add_column :pages, :reversed, :boolean, default: false
  end
end
