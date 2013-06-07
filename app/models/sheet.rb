# == Schema Information
#
# Table name: sheets
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  company_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Sheet < ActiveRecord::Base
  belongs_to :company

  has_one :description
  has_many :pages

  attr_accessible :name

  before_update :save_description
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
    @body = value
  end

  def update_fields(params)
    self.subtitle = params[:subtitle]

    errors = false
    self.pages.each do |page|
      name = page.name
      page.name  = params["#{name}_name"]
      page.title = params["#{name}_title"]
      page.subtitle = params["#{name}_subtitle"]
      page.short_body = params["#{name}_shortbody"]
      page.body = params["#{name}_body"]
      page.reversed = !params["#{name}_reversed"].nil?

      page.pictures.each do |pic|
        pic.title = params["#{pic.id}_title"]
        pic.subtitle = params["#{pic.id}_subtitle"]
        errors = true unless pic.save
      end

      errors = true unless page.save
    end
    errors
  end

  private

    def default_values_for_description
      @title = description.title
      @body = description.body
    end

    def save_description
      description.title = @title
      description.body = @body
      description.save
    end
end
