require "test_helper"

feature "VisitIndexPage" do
  scenario "the index page returns content" do
    visit root_path
    page.must_have_content "How to do just about anything"
  end
end
