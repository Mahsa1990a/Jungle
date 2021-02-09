require 'rails_helper'

# feature block => describe block
RSpec.feature "Visitor navigates to home page", type: :feature, js: true do

  # scenario block => it block
  scenario "They see all products" do
    # ACT
    visit root_path

    # DEBUG / VERIFY
    save_screenshot 'test1.png'
  end

end