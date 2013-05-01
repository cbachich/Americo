# == Schema Information
#
# Table name: descriptions
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  body       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  company_id :integer
#  page_id    :integer
#  sheet_id   :integer
#  short_body :string(255)
#  picture_id :integer
#

require 'spec_helper'

describe Description do
  before do
    @desc = 
      Description.create(
        title: "Test Title", 
         body: "Testing the body contains text") 
  end

  subject { @desc }

  it { should respond_to(:title) }
  it { should respond_to(:body) }
  it { should respond_to(:created_at) }
  it { should respond_to(:updated_at) }

  describe "when title is not present" do
    before { @desc.title = " " }
    it { should_not be_valid }
  end

  describe "when body is not present" do
    before { @desc.body = " " }
    it { should_not be_valid }
  end
end
