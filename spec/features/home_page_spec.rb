require 'rails_helper'

# feature block => describe block
RSpec.feature "Visitor navigates to home page", type: :feature, js: true do

  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        quantity: 10,
        price: 64.99
      )
    end
  end

  # scenario block => it block
  scenario "They see all products" do
    # ACT
    visit root_path

    # DEBUG / VERIFY
    save_screenshot 'test1.png'

    # we set our first expectation of content we expect the user to see on the page
    expect(page).to have_css 'article.product', count: 10
  end

end