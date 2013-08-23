class RemoveSubtitleFromPages < ActiveRecord::Migration
  def change
    remove_column :pages, :subtitle, :string
  end
end
