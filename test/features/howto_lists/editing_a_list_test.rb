require "test_helper"

feature "Howtolists::EditingAList" do
  scenario "with valid content" do
    howto_list = howto_lists(:one)
    visit howto_list_path(howto_list.id)
    click_link('Edit List Attributes')
    fill_in "Name", with: "New howto_list name"
    fill_in "Author", with: "New Author"
    click_button "Update Howto list"
    page.text.must_include "Updated list"
    page.must_have_content "New howto_list name"
    page.wont_have_content howto_lists(:one).name
  end

  scenario "with invalid content" do
    howto_list = howto_lists(:two)
    visit howto_list_path(howto_list.id)
    click_link('Edit List Attributes')
    fill_in "Name", with: ""
    click_button "Update Howto list"
    page.text.must_include "prohibited this howto_list from being saved"
  end
end
