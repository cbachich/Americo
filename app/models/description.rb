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
#

class Description < ActiveRecord::Base
  attr_accessible :title, :body

  belongs_to :company
  belongs_to :page

  validates :title, presence: true
  validates :body, presence: true
end
