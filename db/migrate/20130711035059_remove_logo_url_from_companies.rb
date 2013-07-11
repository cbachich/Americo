class RemoveLogoUrlFromCompanies < ActiveRecord::Migration
  def up
    remove_column :companies, :logo_url
  end

  def down
    add_column :companies, :logo_url, :string
  end
end
