require 'rails_helper'

RSpec.describe User, type: :model do
  describe "validations" do
    it "is invalid without an email" do
      user = User.new(email: nil)
      user.valid?
      expect(user.errors).to have_key(:email)
    end

    it "is invalid with a duplicate email address" do
      User.create(
        email: "selma@gmail.com",
        password: "selma1234",
        name: "Selma",
        role: "buyer"
      )
      user = User.new(
        email: "selma@gmail.com",
        password: "selma1234",
        name: "Selma",
        role: "buyer"
      )
      user.valid?
      expect(user.errors).to have_key(:email)
    end

    it "is invalid without a password" do
      user = User.new(password: nil)
      user.valid?
      expect(user.errors).to have_key(:password)
    end

    it "is invalid with a password shorter than 6 characters" do
      user = User.new(password: "12345")
      user.valid?
      expect(user.errors).to have_key(:password)
    end

    it "is invalid without a name" do
      user = User.new(name: nil)
      user.valid?
      expect(user.errors).to have_key(:name)
    end

    it "is invalid without a role" do
      user = User.new(role: nil)
      user.valid?
      expect(user.errors).to have_key(:role)
    end

    it "is invalid if role does not include admin or buyer or organizer" do
      user = User.new(role: "invalid")
      user.valid?
      byebug
      expect(user.errors).to have_key(:role)
    end

    it "is valid with a name, email, password, role" do
      user = User.new(
        name: "Selma",
        email: "selma@gmail.com",
        password: "selma1234",
        role: "buyer"
      )

      expect(user).to be_valid
    end
  end
end
