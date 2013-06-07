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
#

class Company < ActiveRecord::Base
  attr_accessible :title, :logo_url, :phone, :fax

  has_one :description
  has_many :sheets

  validates :title, presence: true

  before_update :save_description
  after_find :default_values_for_description

  def quick_description
    description.title
  end

  def quick_description=(value)
    @quick_description = value
  end

  def summary
    description.body
  end

  def summary=(value)
    @summary = value
  end

  def pages
    pages = []
    sheets.each do |sheet|
      pages += sheet.pages
    end
    pages
  end

  private

    def default_values_for_description
      @quick_description = description.title
      @summary = description.body
    end

    def save_description
      description.title = @quick_description
      description.body = @summary
      description.save
    end
end
