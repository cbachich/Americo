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
#  banner_image      :string(255)
#  row               :integer          default(0)
#

class Page < ActiveRecord::Base
  belongs_to :sheet

  default_scope :order => 'row ASC'

  mount_uploader :banner_image, ImageUploader

  attr_accessible :name, 
                  :title, 
                  :short_description,
                  :description,
                  :reversed,
                  :banner_image,
                  :row

  has_many :pictures, dependent: :destroy

  def banner_image_url
    if banner_image?
      banner_image
    else
      "upload_picture.jpg"
    end
  end
end
