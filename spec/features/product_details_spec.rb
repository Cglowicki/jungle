require 'rails_helper'

RSpec.feature "ProductDetails", type: :feature, js: true do
  #SETUP
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

  scenario "Users see product details page after clicking a specific product" do
    # ACT
    visit root_path
    # find("[href='/products/10']")
    find_link("Details").trigger("click")


    # DEBUG / VERIFY
    # sleep(10), to load img?
    expect(page).to have_css '.products-show'
    #save_screenshot
  end
end
