# == Schema Information
#
# Table name: pictures
#
#  id         :integer          not null, primary key
#  page_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  image      :string(255)
#  title      :string(255)
#  details    :text
#

class Picture < ActiveRecord::Base
  belongs_to :page

  mount_uploader :image, ImageUploader
  
  attr_accessible :image, :title, :details

  def image_url
    if image?
      image
    else
      "upload_picture.jpg"
    end
  end
end
