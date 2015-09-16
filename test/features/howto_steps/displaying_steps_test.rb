require "test_helper"

feature "Steps::DisplayingSteps" do
  scenario "vising a how-to list displays relevant steps" do
    list = howto_lists(:one)
    visit howto_list_path(list.id)
    page.must_have_content steps(:one).description
    page.must_have_content steps(:two).description
    page.must_have_content steps(:three).description
  end
end
