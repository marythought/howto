require "test_helper"

feature "Howtolists::Createlists" do
  scenario "create a new how to list" do
    visit root_path
    click_link('New Howto list')
    fill_in 'Name', with: howto_lists(:one).name
    fill_in "Author", with: howto_lists(:one).author
    fill_in "Image url", with: howto_lists(:one).image_url
    click_button('Create Howto list')
    page.text.must_include "Howto list was successfully created"
    page.status_code.must_equal 200
  end
end

feature "Projects::CreatingAProject" do
  scenario "when a how to list is submitted with invalid info" do
    visit root_path
    click_link('New Howto list')
    fill_in 'Name', with: ""
    fill_in "Author", with: ""
    click_button('Create Howto list')
    page.text.must_include "Name can't be blank"
    page.text.must_include "Author can't be blank"
  end
end
