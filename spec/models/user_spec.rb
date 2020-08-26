require 'rails_helper'

RSpec.describe User do
  describe 'Validations' do
    
    before(:each) do
      @user = User.new
    end
    

  it 'fails if password is not present' do
    @user.name = "Mike"
    @user.email = "mike@gmail.com"
    @user.password_digest = nil
    @user.password_confirmation = "hellobird"
    expect(@user).to_not be_valid
    expect(@user.errors.full_messages).to eq ["Password can't be blank", "Password can't be blank"]
  end

  it 'fails if password confirmation is not present' do
    @user.name = "Mike"
    @user.email = "mike@gmail.com"
    @user.password_digest = "hellobird"
    @user.password_confirmation = nil
    expect(@user).to_not be_valid
    expect(@user.errors.full_messages).to eq ["Password confirmation can't be blank", "Password can't be blank"]
  end

    it 'fails when password does not match password confirmation' do
      @user.name = "Mike"
      @user.email = "mike@gmail.com"
      @user.password = "hellobear"
      @user.password_confirmation = "hello"
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to eq ["Password confirmation doesn't match Password"]
    end

    it 'fails when password length is too short' do
      @user.name = "Mike"
      @user.email = "mike@gmail.com"
      @user.password = "he"
      @user.password_confirmation = "he"
      expect(@user.password.length).to be < 5
      expect(@user.errors.full_messages).to eq []
    end

    it 'fails when name is not present' do
      @user.name = nil
      @user.email = "mike@gmail.com"
      @user.password = "hellobird"
      @user.password_confirmation = "hellobird"
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to eq ["Name can't be blank"]
    end

    it 'fails when email is not present' do
      @user.name = "Mike"
      @user.email = nil
      @user.password = "hellobird"
      @user.password_confirmation = "hellobird"
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to eq ["Email can't be blank"]
    end
  end

  describe '.authenticate_with_credentials' do
    before(:each) do
      @user = User.new
    
    end

    it "fails when invalid email and password are entered" do
      @user.name = "Mike"
      @user.email = "mike@gmail.com"
      @user.password = "hellobear"
      expect(User.authenticate_with_credentials(@user.email, "hellobird")).to eq(false)
    end

  end
end
