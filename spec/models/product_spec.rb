require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    context 'Checks that a product with all fields set' do
      it 'saves properly' do
        Category.new(name: "test").save
        @category = Category.first.id
        @product = Product.new(name: "test", category_id: @category, quantity: 1, price: 1).save
        expect(@product).to eq(true)
      end
    end

    context 'Tries to save with a nil-value name' do
      it 'validates "name"' do
        Category.new(name: "test").save
        @category = Category.first.id
        @product = Product.new(name: nil, category_id: @category, quantity: 1, price: 1)
        expect(@product).to be_invalid
        expect(@product.errors[:name]).to be_present
      end
    end

    context 'Tries to save with a nil-value price' do
      it 'validates price' do
        Category.new(name: "test").save
        @category = Category.first.id
        @product = Product.new(name: "test", category_id: @category, quantity: 1, price: nil)
        expect(@product).to be_invalid
        expect(@product.errors[:price]).to be_present
      end
    end

    context 'Tries to save with a nil-value quantity' do
      it 'validates quantity' do
        Category.new(name: "test").save
        @category = Category.first.id
        @product = Product.new(name: "name", category_id: @category, quantity: nil, price: 1)
        expect(@product).to be_invalid
        expect(@product.errors[:quantity]).to be_present
      end
    end

    context 'Tries to save with a nil-value category' do
      it 'validates category' do
        @product = Product.new(name: "name", category_id: nil, quantity: 1, price: 1)
        expect(@product).to be_invalid
        expect(@product.errors[:category]).to be_present
      end
    end
  end
end
