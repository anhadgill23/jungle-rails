require 'rails_helper'

RSpec.describe User, type: :model do

  before(:each) do
    @user = User.create(
        :name => "Example",
        :email => "email@email",
        :password => "password",
        :password_confirmation => "password"
        )
  end

    it 'must be created with password and password_confirmation fields that match' do
      @user.password = "passwordCheck"
      @user.password_confirmation = "passwordCheck"
      @user.save
      expect(@user).to be_valid
    end

    it 'must be created with password and password_confirmation fields that match' do
      @user.password = "passwordCheck"
      @user.password_confirmation = "passwordCheck222"
      @user.save
      expect(@user).to_not be_valid
    end

    it 'should have an email' do
      @user.email = nil
      puts @user.valid?
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include "Email can't be blank"
    end

    it 'should have a name' do
      @user.name = nil
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include "Name can't be blank"
    end

    it 'must have a unique email' do

      user1 = User.new name: 'Anhad', email: 'TEST@TEST.com', password: "passwordCheck"
      user2 = User.new name: 'Anhad', email: 'test@test.COM', password: "passwordCheck"
      expect(user1).to_not be_valid
      expect(user2).to_not be_valid
    end

    it 'must have a minimum password length' do
      @user.password = 'test'
      expect(@user.password.size > 6).to be false
    end


end
