class AddPagesToCompany < ActiveRecord::Migration
  def change
    add_column :pages, :company_id, :integer
  end
end
