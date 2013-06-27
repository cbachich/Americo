class AddSubtitleSummaryToCompanies < ActiveRecord::Migration
  def up
    add_column :companies, :subtitle, :string
    add_column :companies, :summary, :string
  end

  def down
    remove_column :companies, :subtitle
    remove_column :companies, :summary
  end
end
