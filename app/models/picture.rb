# == Schema Information
#
# Table name: pictures
#
#  id         :integer          not null, primary key
#  page_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  image      :string(255)
#

class Picture < ActiveRecord::Base
  belongs_to :page

  mount_uploader :image, ImageUploader
  
  attr_accessible :url, :image

  has_one :description
  
  before_update :save_description
  after_find :default_values_for_description

  def title
    description.title
  end

  def title=(value)
    @title = value
  end

  def subtitle
    description.body
  end

  def subtitle=(value)
    @subtitle = value
  end

  def image_url
    if image?
      image
    else
      "upload_picture.jpg"
    end
  end

  private

    def default_values_for_description
      @title = description.title
      @subtitle = description.body
    end

    def save_description
      description.title = @title
      description.body = @subtitle
      description.save
    end
end
