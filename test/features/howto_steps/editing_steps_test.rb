require "test_helper"

feature "Howtolists::EditingAList" do
  before do
    howto_list = howto_lists(:two)
    visit howto_list_path(howto_list.id)
    click_link('Edit steps')
  end

  scenario "with valid content" do
    step = steps(:four)
    click_link('Edit')
    fill_in "Description", with: "New description"
    click_button "Update Step"
    page.text.must_include "Saved step."
    page.must_have_content "New description"
    page.wont_have_content steps(:four).description
  end

  scenario "with invalid content" do
    step = steps(:four)
    click_link('Edit')
    fill_in "Description", with: ""
    click_button "Update Step"
    page.text.must_include "That step could not be saved."
  end
end
