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
#  page_id    :integer
#  sheet_id   :integer
#

class Description < ActiveRecord::Base
  belongs_to :company
  belongs_to :page
  belongs_to :sheet

  attr_accessible :title, :body

  validates :title, presence: true
  validates :body, presence: true
end
