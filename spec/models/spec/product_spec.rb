require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it 'fails when name is nil' do
      @product = Product.new
      @product.name = nil
      @product.price = 500
      @product.quantity = 10
      @category = Category.new
      @product.category = @category
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to eq ["Name can't be blank"]
    end
    it 'fails when price is nil' do
      @product = Product.new
      @product.name = "Dog"
      @product.price = nil
      @product.quantity = 10
      @category = Category.new
      @product.category = @category
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to eq ["Price cents is not a number", "Price is not a number","Price can't be blank"]
    end
    it 'fails when quantity is nil' do
      @product = Product.new
      @product.name = "Dog"
      @product.price = 500
      @product.quantity = nil
      @category = Category.new
      @product.category = @category
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to eq ["Quantity can't be blank"]
    end
    it 'fails when category is nil' do
      @product = Product.new
      @product.name = "Dog"
      @product.price = 500
      @product.quantity = 10
      @category = nil
      @product.category = @category
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to eq ["Category can't be blank"]
    end
    it 'validates product name, price, quantity and catrgory' do
      @product = Product.new
      @product.name = "Dog"
      @product.price = 500
      @product.quantity = 10
      @category = Category.new
      @product.category = @category
      expect(@product).to be_valid
      @product.save!
    end
  end
end
#do one positive test where nothing is nil and add @product.save! at the end (maybe) and .to be_valid for the expect