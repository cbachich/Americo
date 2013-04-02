class RemoveCompanyFromDescription < ActiveRecord::Migration
  def up
    remove_column :descriptions, :company
  end

  def down
  end
end
