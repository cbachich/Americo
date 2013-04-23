class CreateSheets < ActiveRecord::Migration
  def change
    create_table :sheets do |t|
      t.string :name
      t.references :company

      t.timestamps
    end
    add_index :sheets, :company_id
  end
end
