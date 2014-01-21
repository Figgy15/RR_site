require 'spec_helper'

describe "Users pages" do

  subject {page}

# To test the user show page, I'll need a User model object so that the code in the show action
# where we need to fill in the comment with the appropriate code. This uses the user_path named route
# to generate the path to the show page for the given user. It then tests that the page content and
# title both contain the user’s name.
  describe "profile page" do
    let(:user) { FactoryGirl.create(:user) }
    before { visit user_path(user) }

    it { should have_content(user.name) }
    it { should have_title(user.name) }
  end

  describe "signup page" do
    before { visit signup_path }

    let(:submit) { "Start Running" }

    describe "with invalid information" do
      it "should not create a user" do
        expect { click_button submit }.not_to change(User, :count)
      end
    end

    describe "with valid information" do
# The case of valid data is similar, but instead of verifying that the user count doesn’t change, 
# we check that clicking the button changes the count by 1:
      before do
        fill_in "Name",         with: "Example User"
        fill_in "Email",        with: "user@example.com"
        fill_in "Password",     with: "foobar"
        fill_in "Password_Confirmation", with: "foobar"
      end

      it "should create a user" do
# When submitting invalid data, we expect the user count not to change; when submitting valid data, 
# we expect it to change by 1. We can express this in RSpec by combining the expect method with either 
# the to method or the not_to method. We’ll start with the invalid case since it is simpler; we visit the 
# signup path and click the button, and we expect it not to change the user count:
        expect { click_button submit }.to change(User, :count).by(1)
 # This is for the benefit of the change method, which takes as arguments an object and a symbol and then 
 # calculates the result of calling that symbol as a method on the object both before and after the block. 
 # In other words, the above code calculates User.count from Rails Console.  This happens before and affer
 # the excution of click_button.
      end
    end
end
