class CreateQuotes < ActiveRecord::Migration
  def change
    create_table :quotes do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.string :company
      t.text :comments
      t.string :attachment_1
      t.string :attachment_2
      t.string :attachment_3
      t.string :attachment_4
      t.string :attachment_5

      t.timestamps
    end
  end
end
