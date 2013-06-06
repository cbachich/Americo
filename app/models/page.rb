# == Schema Information
#
# Table name: pages
#
#  id             :integer          not null, primary key
#  name           :string(255)
#  banner_img_url :string(255)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  title          :string(255)
#  reversed       :boolean          default(FALSE)
#  sheet_id       :integer
#

class Page < ActiveRecord::Base
  belongs_to :sheet

  attr_accessible :name, :title, :reversed, :banner_img_url

  has_one :description 
  has_many :pictures

  before_save :save_description
  after_find :default_values_for_description

  def subtitle
    description.title
  end

  def subtitle=(value)
    @subtitle = value
  end

  def short_body
    description.short_body
  end

  def short_body=(value)
    @short_body = value
  end

  def body
    description.body
  end

  def body=(value)
    @body = value
  end

  private

    def default_values_for_description
      @subtitle = description.title
      @short_body = description.short_body
      @body = description.body
    end

    def save_description
      description.title = @subtitle
      description.short_body = @short_body
      description.body = @body
      description.save
    end
end
