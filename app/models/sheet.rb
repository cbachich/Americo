# == Schema Information
#
# Table name: sheets
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  company_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  title      :string(255)
#  subtitle   :string(255)
#

class Sheet < ActiveRecord::Base
  belongs_to :company

  has_many :pages

  attr_accessible :name, :title, :subtitle

  def update_fields(params)
    self.subtitle = params[:subtitle]

    errors = false
    self.pages.each do |page|
      name = page.name
      page.name  = params["#{name}_name"]
      page.title = params["#{name}_title"]
      page.subtitle = params["#{name}_subtitle"]
      page.short_description = params["#{name}_short"]
      page.description = params["#{name}_description"]
      page.reversed = !params["#{name}_reversed"].nil?

      i = 0
      page.pictures.each do |pic|
        pic_s = "#{page.name}_#{i}"
        i += 1
        pic.image = params["#{pic_s}_image"] if defined? params["#{pic_s}_image"]
        pic.title = params["#{pic_s}_title"]
        pic.details = params["#{pic_s}_details"]
        errors = true unless pic.save
      end

      while i < 4
        pic_s = "#{page.name}_#{i}"
        i += 1
        pic_image = params["#{pic_s}_image"]
        if !pic_image.nil?
          page.pictures.create(
            title: params["#{pic_s}_title"], 
            details: params["#{pic_s}_details"],
            image: pic_image)
        end
      end

      errors = true unless page.save
    end
    errors
  end
end
