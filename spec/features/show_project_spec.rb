require 'rails_helper'

describe "show an individual project" do
  it "should show project details" do
    project1 = Project.create(project_attributes(target_pledge_amount: 100.00))

    visit project_url(project1)

    expect(page).to have_text(project1.name)
    expect(page).to have_text(project1.description)
    expect(page).to have_text("$100.00")
    expect(page).to have_text(project1.website)

  end
  it "shows the number of days remaining if the pledging end date is in the future" do
    project = Project.create(project_attributes(pledging_ends_on: 30.days.from_now))
    visit project_url(project)
    expect(page).to have_text("29 days")
  end

  it "shows 'All Done!' if the pledging end date is in the past" do
    project = Project.create(project_attributes(pledging_ends_on: 30.days.ago))
    visit project_url(project)
    expect(page).to have_text("All Done!")
  end
end
