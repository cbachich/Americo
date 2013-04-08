class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :name
      t.string :banner_img_url

      t.timestamps
    end
  end
end
