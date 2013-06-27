# == Schema Information
#
# Table name: descriptions
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  body       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  company_id :integer
#  short_body :string(255)
#

class Description < ActiveRecord::Base
  belongs_to :company

  attr_accessible :title, :short_body, :body

  validates :title, presence: true
  validates :body, presence: true
end
