# == Schema Information
#
# Table name: pages
#
#  id                :integer          not null, primary key
#  name              :string(255)
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  title             :string(255)
#  reversed          :boolean          default(FALSE)
#  sheet_id          :integer
#  short_description :string(255)
#  description       :text
#  bullet_1          :string(255)
#  bullet_2          :string(255)
#  bullet_3          :string(255)
#  banner_image      :string(255)
#

class Page < ActiveRecord::Base
  belongs_to :sheet

  mount_uploader :banner_image, ImageUploader

  attr_accessible :name, 
                  :title, 
                  :bullet_1,
                  :bullet_2,
                  :bullet_3,
                  :short_description,
                  :description,
                  :reversed,
                  :banner_image

  has_many :pictures, dependent: :destroy

  def bullets
    [bullet_1, bullet_2, bullet_3]
  end

  def banner_image_url
    if banner_image?
      banner_image
    else
      "upload_picture.jpg"
    end
  end
end
