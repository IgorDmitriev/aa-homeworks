require 'rails_helper'

RSpec.describe User, type: :model do
  # validations
  it { should validate_presence_of(:username) }
  it { should validate_presence_of(:password_digest) }
  it { should validate_length_of(:password).is_at_least(6) }

  # associations
  it { should have_many(:subs) }
  it { should have_many(:user_votes) }
  it { should have_many(:comments) }

  # #is_password?
  describe "#is_password?" do
    it "return false if not a password" do
      user = User.create(username: "user", password: "123123")

      expect(user.is_password?("321321")).to be false
    end

    it "return true if correct password" do
      user = User.create(username: "user", password: "123123")

      expect(user.is_password?("123123")).to be true
    end
  end

  #reset_session_token
  describe "#reset_session_token" do
    it "should assign new session token" do
      user = User.create(username: "user", password: "123123")
      old_token = user.session_token
      user.reset_session_token!

      expect(user.session_token).to_not eq(old_token)
    end
  end

  #:find_by_credentials
  describe "::find_by_credentials" do
    it "should return nil if no user" do
      User.create(username: "user", password: "123123")
      # debugger
      result = User.find_by_credentials("user2", "123123")

      expect(result).to eq(nil)
    end

    it "should return nil if wrong password" do
      User.create(username: "user", password: "123123")
      result = User.find_by_credentials("user", "321321")

      expect(result).to eq(nil)
    end

    it "should return user if password is correct" do
      user = User.create(username: "user", password: "123123")
      result = User.find_by_credentials("user", "123123")

      expect(result).to eq(user)
    end
  end


end
