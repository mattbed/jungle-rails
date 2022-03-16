require 'rails_helper'

RSpec.feature "Visitor clicks Add to Cart button", type: :feature, js: true do
  
   # SETUP
   before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name: Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "Item is added to cart and updates counter" do
    # ACT
    visit root_path
    first('.product').click_button('Add')
    # DEBUG
    # save_screenshot

    # VERIFY
    expect(page).to have_link("My Cart (1)", :href=>"/cart")
  end
end
