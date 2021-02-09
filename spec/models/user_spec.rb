require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do

    it "shoud save new user with valid credentials" do
      user = User.create(
        name: "Pat Flowers",
        email: "pflow@email.com",
        password: "123123",
        password_confirmation: "123123"
      )
      expect(user).to be_valid
    end

    # it 'should not save user without a unique email' do
    #   @userA = User.create(
    #     name: "Pat Flowers",
    #     email: "pflow@email.com",
    #     password_digest: "123123"
    #     )
    #   @userB = User.create(
    #     name: "Pat Flowers",
    #     email: "PFLOW@EMAIL.COM",
    #     password_digest: "123123"
    #     )
    #   expect(@userB).to_not be_valid
    # end

    it "should not save a user if password and password_confirmation do not match" do
      password = User.create(
        name: "Pat Flowers",
        email: "pflow@email.com",
        password: "123123",
        password_confirmation: "321321"
      )
      expect(password).to_not be_equal(password.password_confirmation)
    end

    it "should not save a user if password field is left empty" do
      password = User.create(
        name: "Pat Flowers",
        email: "pflow@email.com",
        password: nil,
        password_confirmation: "321321"
      )
      expect(password).to_not be_valid
    end

    it "should not save a user if password_confirmation field is left empty" do
      password = User.create(
        name: "Pat Flowers",
        email: "pflow@email.com",
        password: "123123",
        password_confirmation: nil
      )
      expect(password).to_not be_equal(password.password_confirmation)
    end

  #   it "should not validate a user if password is less than 3 characters" do
  #     user = User.create(
  #       name: "Pat Flowers",
  #       email: "pflow@email.com",
  #       password: "12",
  #       password_confirmation: "12"
  #     )
  #     expect(user).to_not be_valid
  #   end
  # end

  # describe '.authenticate_witb_credentials' do
  #   user = User.create(
  #     name: "Pat Flowers",
  #     email: "pflow@email.com",
  #     password: "123123",
  #     password_confirmation: "123123"
  #     )
  #   authenticate = User.authenticate_with_credentials(user.email, user.password)
  #   expect(authenticate).to_not be_valid
  # end
  end
end
