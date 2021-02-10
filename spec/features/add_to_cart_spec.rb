require 'rails_helper'

RSpec.feature "AddToCarts", type: :feature, js: true do
  before :each do
    @category = Category.create! name: 'Apparel'

      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end

    scenario "updates cart items count when 'add to cart' is clicked" do
      visit root_path
      expect(page).to have_text 'My Cart (0)'
      click_on('Add')
      expect(page).to have_text 'My Cart (1)'
    end
end
