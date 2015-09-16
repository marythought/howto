require "test_helper"

feature "HowtoSteps::CreatingSteps" do
  before do
    howto_list = howto_lists(:one)
    visit howto_list_path(howto_list.id)
    click_link('Edit steps')
  end

  scenario "add a valid step to a howto list" do
    click_link('New Step')
    fill_in "Description", with: steps(:one)
    click_button('Create Step')
    page.text.must_include "Step was successfully created"
    page.status_code.must_equal 200
  end

  scenario "error with invalid step" do
    click_link('New Step')
    fill_in "Description", with: ""
    click_button('Create Step')
    page.text.must_include "Description can't be blank"
  end
end
