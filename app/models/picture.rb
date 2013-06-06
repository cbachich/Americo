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
  
  before_save :save_description
  after_find :default_values_for_description

  def title
    description.title
  end

  def title=(value)
    @title = value
  end

  def subtitle
    description.body
  end

  def subtitle=(value)
    @subtitle = value
  end

  private

    def default_values_for_description
      @title = description.title
      @subtitle = description.body
    end

    def save_description
      description.title = @title
      description.body = @subtitle
      description.save
    end
end
