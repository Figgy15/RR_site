
require 'spec_helper'



describe User do

  # pending "add some examples to (or delete) #{__FILE__}"

  # Create a global type variable that can be used with the merge function.
  # so that there isn't any uncessary repeats.

# NONE OF THIS CODE IS NEEDED NOW THAT DEVISE IS BEING USED.
=begin  
  # IS ANY OF THIS NEEDED NOW THAT I'M USING DEVISE???
  before do
    @user = User.new(name: "Example User", email: "user@example.com", password: "foobar", password_confirmation: "foobar")
  end

  subject { @user }

  it { should respond_to(:name) }
  it { should respond_to(:email) }
  it { should respond_to(:password_digest) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }

  it { should_not be_valid }

  describe "when password is not present" do
    before do
      @user = User.new(name: "Example User", email: "user@example.com", password: " ", password_confirmation: " ")
    end
    it { should_not be_valid }
  end

  describe "when password doesn't match confirmation" do
    before {@user.password_confirmation = "mismatch"}
    it {should_not be_valid}
  end
=end
end

