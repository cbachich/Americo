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

  attr_accessible :banner_img_url, :name, :title, :reversed

  has_one :description 
  has_many :pictures

  def subtitle
    description.title
  end

  def short_body
    description.short_body
  end

  def body
    description.body
  end
end
