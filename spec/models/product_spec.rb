require 'rails_helper'

RSpec.describe Product, type: :model do

  describe 'Validations' do
    before(:each) do
      @category = Category.create(:name => 'category_name')
      @product = Product.create(:name => 'Product',
        :description => 'Cool product',
        :image => 'abc.jpeg',
        :price_cents => 200,
        :quantity => 5)
    end

    it 'should be a valid product' do
      @product.name = nil
      @product.description = nil
      @product.image = nil
      @product.price_cents = nil
      @product.quantity = nil
      expect(@product).to_not be_valid
      expect(@product.error.full_messages).to include "Name cannot be empty", "Price cannot be empty", "Image cannot be empty", "Quantity cannot be empty", "Category cannot be empty"
      expect(User.ordered_by_last_name).to eq([chelimsky, lindeman])
  end

    it 'should have a name' do
      @product.name = nil
      expect(@product).to_not be_valid
      expect(@product.error.full_messages).to include "Name cannot be empty"
    end

    it 'should have a price' do
      @product.price = nil
      expect(@product).to_not be_valid
      expect(@product.error.full_messages).to include "Price cannot be empty"
    end

    it 'should have a quantity' do
      @product.quantity = nil
      expect(@product).to_not be_valid
      expect(@product.error.full_messages).to include "Quantity cannot be empty"
    end

    it 'should have a category' do
      @product.category = nil
      expect(@product).to_not be_valid
      expect(@product.error.full_messages).to include "Category cannot be empty"
    end
  end
end
