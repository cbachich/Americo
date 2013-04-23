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

  attr_accessible :banner_img_url, :name

  has_one :description 
end
