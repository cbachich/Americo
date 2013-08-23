# == Schema Information
#
# Table name: pages
#
#  id                :integer          not null, primary key
#  name              :string(255)
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  title             :string(255)
#  reversed          :boolean          default(FALSE)
#  sheet_id          :integer
#  short_description :string(255)
#  description       :text
#  banner_image      :string(255)
#

require 'spec_helper'

describe Page do
  
  before do
    @page =
      Page.create(
                  name: "Test Page",
        banner_img_url: "/images/test_banner")
  end

  it { should respond_to(:name) }
  it { should respond_to(:banner_img_url) }

  describe "when description is set" do
    before do
      desc = 
        Description.create(
          title: "Test",
           body: "Testing")
      @page.description = desc
    end
    it { should be_valid }
  end

end
