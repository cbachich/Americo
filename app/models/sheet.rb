# == Schema Information
#
# Table name: sheets
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  company_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Sheet < ActiveRecord::Base
  belongs_to :company

  has_one :description
  has_many :pages

  attr_accessible :name
end
