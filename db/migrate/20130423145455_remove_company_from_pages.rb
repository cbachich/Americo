class RemoveCompanyFromPages < ActiveRecord::Migration
  def up
    remove_column :pages, :company_id
  end

  def down
    add_column :pages, :company_id, :integer
  end
end
