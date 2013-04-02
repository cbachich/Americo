# == Schema Information
#
# Table name: descriptions
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  body       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Description < ActiveRecord::Base
  attr_accessible :title, :body

  validates :title, presence: true
  validates :body, presence: true
end
