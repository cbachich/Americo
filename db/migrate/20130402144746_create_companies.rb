class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :title
      t.string :logo_url
      t.string :phone
      t.string :fax

      t.timestamps
    end
  end
end
