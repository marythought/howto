require "test_helper"

feature "Howtolists::ShowingAList" do
  scenario "visiting a how-to project" do
    visit howto_list_path(howto_lists(:one).id)
    page.must_have_content howto_lists(:one).name
    page.must_have_content howto_lists(:one).author
    page.must_have_content howto_lists(:one).materials
  end
end
