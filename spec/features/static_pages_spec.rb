require 'spec_helper'

describe "Static pages" do

  subject { page }

  shared_examples_for "all static pages" do
    it { should have_selector('h3',    text: heading) }
    it { should have_selector('title', text: full_title(page_title)) }
  end

  describe "Home page" do
    before { visit root_path }
    let(:heading)    { company.description.title }
    let(:page_title) { '' }

    it_should_behave_like "all static pages"
    it { should_not have_selector('title', :text => '| Home') }
  end
end
