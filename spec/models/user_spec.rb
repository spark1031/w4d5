require 'rails_helper'

RSpec.describe User, type: :model do

  subject(:user) do
    User.create!(
      username: "sue",
      password: "suepassword"
    )
  end

  describe "password encryption" do
    it "does not save password in database" do
      User.create!(username: "ryan", password: "ryanpassword")
      user = User.find_by(username: "ryan")
      expect(user.password).not_to be("ryanpassword")
    end

    it "encrypts password using BCrypt" do
      expect(BCrypt::Password).to receive(:create)
      User.new(username: "ryan", password: "ryanpassword")
    end
  end

  it { should validate_presence_of(:username) }
  it { should validate_uniqueness_of(:username) }
end
