require 'rails_helper'

describe "show an individual project" do
  it "should show project details" do
    project1 = Project.create(name: "Start-Up Project",
               description: "A description of a start-up project",
               target_pledge_amount: 100.00,
               pledging_ends_on: 1.day.from_now,
               website: "http://project-a.com")

    visit project_url(project1)

    expect(page).to have_text(project1.name)
    expect(page).to have_text(project1.description)
    expect(page).to have_text("$100.00")
    expect(page).to have_text(project1.pledging_ends_on)
    expect(page).to have_text(project1.website)

  end
end
