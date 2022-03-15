require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    context 'Checks that a new user input' do
      it 'saves properly with all fields properly set' do
        @user = User.new(first_name: "Test", last_name: "Test", email: "Test@Test.com", password: "testtest", password_confirmation: "testtest").save
        expect(@user).to eq(true)
      end

      it 'fails if password checks do not match' do
        @user = User.new(first_name: "Test", last_name: "Test", email: "Test@Test.com", password: "testtest1", password_confirmation: "testtest2")
        expect(@user).to be_invalid
        expect(@user.errors).to be_present
      end

      it 'validates "first_name" if missing' do
        @user = User.new(first_name: nil, last_name: "Test", email: "Test@Test.com", password: "testtest", password_confirmation: "testtest")
        expect(@user).to be_invalid
        expect(@user.errors[:first_name]).to be_present
      end

      it 'validates "last_name" if missing' do
        @user = User.new(first_name: "Test", last_name: nil, email: "Test@Test.com", password: "testtest", password_confirmation: "testtest")
        expect(@user).to be_invalid
        expect(@user.errors[:last_name]).to be_present
      end

      it 'validates "email" if missing' do
        @user = User.new(first_name: "Test", last_name: "Test", email: nil, password: "testtest", password_confirmation: "testtest")
        expect(@user).to be_invalid
        expect(@user.errors[:email]).to be_present
      end

      it 'validates "password" if missing' do
        @user = User.new(first_name: "Test", last_name: "Test", email: "Test@Test.com", password: nil, password_confirmation: nil)
        expect(@user).to be_invalid
        expect(@user.errors[:password]).to be_present
      end

      it 'should fail if the exact same email is input' do
        @user1 = User.new(first_name: "Test1", last_name: "Test1", email: "Test@Test.com", password: "testtest", password_confirmation: "testtest").save
        @user2 = User.new(first_name: "Test2", last_name: "Test2", email: "Test@Test.com", password: "testtest", password_confirmation: "testtest")
        expect(@user2).to be_invalid
        expect(@user2.errors[:email]).to be_present
      end

      it 'should fail if the same email is input with different cases' do
        @user1 = User.new(first_name: "Test1", last_name: "Test1", email: "TEST@Test.com", password: "testtest", password_confirmation: "testtest").save
        @user2 = User.new(first_name: "Test2", last_name: "Test2", email: "Test@Test.com", password: "testtest", password_confirmation: "testtest")
        expect(@user2).to be_invalid
        expect(@user2.errors[:email]).to be_present
      end

      it 'should fail if the password length is less than 8 characters' do
        @user = User.new(first_name: "Test", last_name: "Test", email: "Test@Test.com", password: "1234567", password_confirmation: "1234567")
        expect(@user).to be_invalid
        expect(@user.errors[:password]).to be_present
      end
    end
  end
end
