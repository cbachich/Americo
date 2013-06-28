# == Schema Information
#
# Table name: companies
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  logo_url   :string(255)
#  phone      :string(255)
#  fax        :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  subtitle   :string(255)
#  summary    :text(255)
#

class Company < ActiveRecord::Base
  attr_accessible :title, :subtitle, :summary, :logo_url, :phone, :fax

  has_many :sheets

  validates :title, presence: true

  def pages
    pages = []
    sheets.each do |sheet|
      pages += sheet.pages
    end
    pages
  end
end
