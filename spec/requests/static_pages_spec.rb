require 'spec_helper'

describe "Static pages" do

  describe "Home page" do

    it "should have the content 'Ultimate Putzplan'" do
      visit '/static_pages/home'
      expect(page).to have_content('Ultimate Putzplan')
    end
  end
end