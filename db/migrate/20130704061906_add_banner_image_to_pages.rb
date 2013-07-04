class AddBannerImageToPages < ActiveRecord::Migration
  def change
    add_column :pages, :banner_image, :string
    remove_column :pages, :banner_img_url
  end
end
