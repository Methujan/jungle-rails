require 'rails_helper'

RSpec.describe Product, type: :model do

  describe 'Validations' do
    it 'Ensure that a product will save with all four fields set' do
      @category = Category.new(name: "Video games")
      @product = Product.new(name:'Pokemon Ruby', price: 50, quantity: 4, category: @category)
      expect(@product).to be_valid
    end

    it 'valids that the product has a name' do
      @category = Category.new(name: "Video games")
      @product = Product.new(price: 50, quantity: 4, category: @category)
      #expect(@product).not_to be_valid
      @product.valid?
      expect(@product.errors.messages[:name]).to include("can't be blank") 
    end

    it 'valids that the product has a price' do
      @category = Category.new(name: "Video games")
      @product = Product.new(name:'Pokemon Ruby', quantity: 4, category: @category)
      #expect(@product).not_to be_valid
      @product.valid?
      expect(@product.errors.messages[:price]).to include("can't be blank") 
    end

    it 'valids that the product has a quantity' do
      @category = Category.new(name: "Video games")
      @product = Product.new(name:'Pokemon Ruby',price: 50, category: @category)
      #expect(@product).not_to be_valid
      @product.valid?
      expect(@product.errors.messages[:quantity]).to include("can't be blank") 
    end

    it 'valids that the product has a category' do
      @category = Category.new(name: "Video games")
      @product = Product.new(name:'Pokemon Ruby',price: 50, quantity:4)
      #expect(@product).not_to be_valid
      @product.valid?
      expect(@product.errors.messages[:category]).to include("can't be blank") 
    end
  end

end
