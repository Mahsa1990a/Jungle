require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do

    it 'should save a valid product' do
      @category = Category.create(name:"Clothes")
      @product = Product.new(
        name: "Shirt",
        price_cents: 50.00,
        quantity: 20,
        category_id: @category.id
      )
      expect(@product).to be_valid
      expect(@product.errors.full_messages).to be_empty
    end

    it 'should not save without valid name' do
      @category = Category.create(name: "Clothes")
      @name = Product.new(
        name: nil,
        price_cents: 50.00,
        quantity: 20,
        category_id: @category.id
      )
      expect(@name).to_not be_valid
      expect(@name.errors.full_messages).to include "Name can't be blank"
    end

    it 'should not save without valid price' do
      @category = Category.create(name: "Clothes")
      @price = Product.new(
        name: "Shirt",
        price_cents: nil,
        quantity: 20,
        category_id: @category.id
      )
      expect(@price).to_not be_valid
      expect(@price.errors.full_messages).to include "Price can't be blank"
    end

    it 'should not save without valid quantity' do
      @category = Category.create(name: "Clothes")
      @quantity = Product.new(
        name: "Shirt",
        price_cents: 50.00,
        quantity: nil,
        category_id: @category.id
      )
      expect(@quantity).to_not be_valid
      expect(@quantity.errors.full_messages).to include "Quantity can't be blank"
    end

    it 'should not save without valid category id' do
      @category = Category.create(name: "Clothes")
      @category_id = Product.new(
        name: "Shirt",
        price_cents: 50.00,
        quantity: 20,
        category_id: nil
      )
      expect(@category_id).to_not be_valid
      expect(@category_id.errors.full_messages).to include "Category can't be blank"
    end

  end
end
