require 'rails_helper'

RSpec.feature "ProductDetails", type: :feature do
  
  
  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "They can navigate to the product detail page from the home page" do
    visit root_path

    first(".pull-right").click

    # DEBUG / VERIFY
    # save_screenshot
    expect(page).to have_css 'article.product-detail'
  end
end
