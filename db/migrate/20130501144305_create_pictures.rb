class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.string :url
      t.references :page

      t.timestamps
    end
    add_index :pictures, :page_id
  end
end
