require 'spec_helper'

describe "LayoutLinks" do

    it "should have the content 'Home Page'" do
      visit '/pages/home'
      expect(page).to have_content('Home Page')
    end

    it "should have the content 'Help Page'" do
      visit '/pages/home'
      expect(page).to have_content('Help Page')
    end

    it "should have the content 'About Us Page'" do
      visit '/pages/home'
      expect(page).to have_content('About Us Page')
    end

    it "should have the content 'Contact Us Page'" do
      visit '/pages/home'
      expect(page).to have_content('Contact Us Page')
    end

    it "should have the right links on the layout" do
      visit root_path
      response.should have_selector('title', :content => "Home")
      click_link "About"
      response.should have_selector('title', :content => "About")
      click_link "Contact"
      response.should have_selector('title', :content => "Contact")
      click_link "Home"
      response.should have_selector('title', :content => "Home")
      click_link "Join Up!"
    end
end
