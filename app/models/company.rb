# == Schema Information
#
# Table name: companies
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  phone      :string(255)
#  fax        :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  subtitle   :string(255)
#  summary    :text(255)
#  logo       :string(255)
#  email      :string(255)
#

class Company < ActiveRecord::Base
  require 'carrierwave/orm/activerecord'
  mount_uploader :logo, LogoUploader

  attr_accessible :title, :subtitle, :summary, :logo, :phone, :fax, :email

  has_many :sheets

  validates :title, presence: true

  def pages
    pages = []
    sheets.each do |sheet|
      pages += sheet.pages
    end
    pages
  end

  def logo_url
    if logo?
      logo
    else
      "upload_picture.jpg"
    end
  end
end
