require 'rails_helper'

describe "project listing page" do
  it "show three project names" do
    visit projects_path
    expect(page).to have_text("3 Projects")
    expect(page).to have_text("Project 1")
    expect(page).to have_text("Project 2")
    expect(page).to have_text("Project 3")
  end

end
