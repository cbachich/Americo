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
#  company_id     :integer
#  reversed       :boolean          default(FALSE)
#

class Page < ActiveRecord::Base
  attr_accessible :banner_img_url, :name

  has_one :description 
  belongs_to :company
end
