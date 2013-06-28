# == Schema Information
#
# Table name: pages
#
#  id                :integer          not null, primary key
#  name              :string(255)
#  banner_img_url    :string(255)
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  title             :string(255)
#  reversed          :boolean          default(FALSE)
#  sheet_id          :integer
#  short_description :string(255)
#  description       :text
#  subtitle          :string(255)
#  bullet_1          :string(255)
#  bullet_2          :string(255)
#  bullet_3          :string(255)
#

class Page < ActiveRecord::Base
  belongs_to :sheet

  attr_accessible :name, 
                  :title, 
                  :bullet_1,
                  :bullet_2,
                  :bullet_3,
                  :subtitle,
                  :short_description,
                  :description,
                  :reversed,
                  :banner_img_url

  has_many :pictures

  def bullets
    [bullet_1, bullet_2, bullet_3]
  end
end
