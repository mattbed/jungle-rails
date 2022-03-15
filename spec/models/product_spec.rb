require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    context 'Checks that an attempt to add product' do
      it 'saves properly with all required fields' do
        Category.new(name: "test").save
        @category = Category.first.id
        @product = Product.new(name: "test", category_id: @category, quantity: 1, price: 1).save
        expect(@product).to eq(true)
      end

      it 'validation rejects an empty "name" field' do
        Category.new(name: "test").save
        @category = Category.first.id
        @product = Product.new(name: nil, category_id: @category, quantity: 1, price: 1)
        expect(@product).to be_invalid
        expect(@product.errors[:name]).to be_present
      end

      it 'validates rejects an empty "price" field' do
        Category.new(name: "test").save
        @category = Category.first.id
        @product = Product.new(name: "test", category_id: @category, quantity: 1, price: nil)
        expect(@product).to be_invalid
        expect(@product.errors[:price]).to be_present
      end

      it 'validates rejects an empty "quantity" field' do
        Category.new(name: "test").save
        @category = Category.first.id
        @product = Product.new(name: "name", category_id: @category, quantity: nil, price: 1)
        expect(@product).to be_invalid
        expect(@product.errors[:quantity]).to be_present
      end

      it 'validates rejects an empty "category" field' do
        @product = Product.new(name: "name", category_id: nil, quantity: 1, price: 1)
        expect(@product).to be_invalid
        expect(@product.errors[:category]).to be_present
      end
    end
  end
end
