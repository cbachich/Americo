class ReplaceSummaryStringWithSummaryText < ActiveRecord::Migration
  def up
    change_column :companies, :summary, :text
  end

  def down
    change_column :companies, :summary, :string
  end
end
