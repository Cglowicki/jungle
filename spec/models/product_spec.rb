require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do

    it "should validate a product with all field attributes" do
      @category = Category.create(name: "Games")
      product = Product.new(
        name: "Mario 64",
        price: 150.00,
        quantity: 3,
        category_id: @category.id
      )
      expect(product).to be_valid
    end

    it "should not valdiate a product with empty name attribute" do
      @category = Category.create(name: "Games")
      name = Product.new(
        name: nil,
        price: 150.00,
        quantity: 3,
        category_id: @category.id
      )
      expect(name).to_not be_valid
    end

    it "should not valdiate a product with empty price attribute" do
      @category = Category.create(name: "Games")
      price = Product.new(
        name: "Mario 64",
        price: nil,
        quantity: 3,
        category_id: @category.id
      )
      expect(price).to_not be_valid
    end

    it "should not valdiate a product with empty quantity attribute" do
      @category = Category.create(name: "Games")
      quantity = Product.new(
        name: "Mario 64",
        price: 150.00,
        quantity: nil,
        category_id: @category.id
      )
      expect(quantity).to_not be_valid
    end

    it "should not valdiate a product with empty category_id attribute" do
      @category = Category.create(name: "Games")
      category_id = Product.new(
        name: "Mario 64",
        price: 150.00,
        quantity: 3,
        category_id: nil
      )
      expect(category_id).to_not be_valid
    end
  end
end
