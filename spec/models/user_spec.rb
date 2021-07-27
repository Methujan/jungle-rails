require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validations' do
    it 'Ensure that an user is created with all validations fields' do
      @user = User.new(first_name: 'Ash', last_name:'Ketchum', email: 'ash@hotmail.com', password: 'catchemall')
      @user.valid?
      expect(@user.errors.messages).not_to include("can\'t be blank")
    end
    it 'Ensure that an user is not created when first name is missing' do
      @user = User.new( last_name:'Ketchum', email: 'ash@hotmail.com', password: 'catchemall')
      @user.valid?
      expect(@user.errors.messages[:first_name]).to include("can\'t be blank")
    end
    it 'Ensure that an user is not created when last name is missing' do
      @user = User.new( first_name:'Ash', email: 'ash@hotmail.com', password: 'catchemall')
      @user.valid?
      expect(@user.errors.messages[:last_name]).to include("can\'t be blank")
    end
    it 'Ensure that an user is not created when email is missing' do
      @user = User.new( first_name:'Ash', last_name:'Ketchum', password: 'catchemall')
      @user.valid?
      expect(@user.errors.messages[:email]).to include("can\'t be blank")
    end
    it 'Ensure that an user is not created when password is missing' do
      @user = User.new( first_name:'Ash', last_name:'Ketchum', email: 'ash@hotmail.com')
      @user.valid?
      expect(@user.errors.messages[:password]).to include("can\'t be blank")
    end
    it 'Ensure that an user is not created when password is too short' do
      @user = User.new( first_name:'Ash', last_name:'Ketchum', email: 'ash@hotmail.com', password: 'catch')
      @user.valid?
      expect(@user.errors.messages[:password]).to include("is too short (minimum is 6 characters)")
    end
  end

  describe '.authenticate_with_credentials' do
    it 'Ensure that an user is saved with email and password' do
    @user = User.new(first_name:'Ash', last_name:'Ketchum', email: 'ash@hotmail.com', password: 'catchemall')
    @user.save
    expect(User.authenticate_with_credentials("ash@hotmail.com", "catchemall")).to be_present
  end
end

end
