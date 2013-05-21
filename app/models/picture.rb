# == Schema Information
#
# Table name: pictures
#
#  id         :integer          not null, primary key
#  url        :string(255)
#  page_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Picture < ActiveRecord::Base
  belongs_to :page

  attr_accessible :url

  has_one :description

  def title
    description.title
  end

  def subtitle
    description.body
  end
end
