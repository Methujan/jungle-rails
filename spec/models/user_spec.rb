require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validations' do
    it 'Ensure that an user is created with all validations fields' do
      @user = User.new(first_name: 'Ash', last_name:'Ketchum', email: 'ash@hotmail.com', password: 'catch')
      @user.valid?
      expect(@user.errors.messages).not_to include("can\'t be blank")
    end
  end

  describe '.authenticate_with_credentials' do
    # examples for this class method here
  end

end
