require 'rails_helper'

RSpec.feature "Visitor navigates to home page", type: :feature, js: true do
  
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

  scenario "They click on product's detail" do
    # ACT
    visit root_path

    # within first('.product') do
    #   click_link 'Details'
    # end     OR:

    click_link('Details', match: :first)

    expect(page).to have_text(/description/i) # adding /../i => menas not sensitive for capital or not capital letters
    save_screenshot 'test2.png'
  end

end
