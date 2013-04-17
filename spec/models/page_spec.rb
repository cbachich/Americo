# == Schema Information
#
# Table name: pages
#
#  id             :integer          not null, primary key
#  name           :string(255)
#  banner_img_url :string(255)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  title          :string(255)
#  company_id     :integer
#  reversed       :boolean          default(FALSE)
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
