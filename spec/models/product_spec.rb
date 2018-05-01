require 'rails_helper'

RSpec.describe Product, type: :model do

  describe 'Validations' do
    before(:each) do
      @category = Category.create(:name => 'category_name')
      @product = @category.products.create(
        :name => 'Product',
        :description => 'Cool product',
        :image => 'abc.jpeg',
        :price => 200,
        :quantity => 5)
    end

    it 'should be a valid product' do
      @product.name = nil
      @product.description = nil
      @product.image = nil
      @product.price_cents = nil
      @product.quantity = nil
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include "Name can't be blank", "Price can't be blank", "Quantity can't be blank"
  end

    it 'should have a name' do
      @product.name = nil
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include "Name can't be blank"
    end

    it 'should have a price' do
      @product.price_cents = nil
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include "Price can't be blank"
    end

    it 'should have a quantity' do
      @product.quantity = nil
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include "Quantity can't be blank"
    end

    it 'should have a category' do
      @product.category = nil
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include "Category can't be blank"
    end
  end
end
