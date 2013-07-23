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
#  address    :string(255)
#  city       :string(255)
#  state      :string(255)
#  zipcode    :integer
#

require 'spec_helper'

describe Company do
  before do
    @company =
      Company.create(
        title: "Test",
        logo_url: "http://test.com",
        phone: "555-555-5555",
        fax: "555-555-5555")
  end

  subject { @company }

  it { should respond_to(:title) }
  it { should respond_to(:logo_url) }
  it { should respond_to(:phone) }
  it { should respond_to(:fax) }
  it { should respond_to(:created_at) }
  it { should respond_to(:updated_at) }

  describe "when title is not present" do
    before { @company.title = " " }
    it { should_not be_valid }
  end

  describe "when description is set" do
    before do
      desc = 
        Description.create(
          title: "Test",
           body: "Testing")
      @company.description = desc
    end
    it { should be_valid }
  end
end
