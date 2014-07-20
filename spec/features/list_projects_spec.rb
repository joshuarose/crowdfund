require 'rails_helper'

describe "project listing page" do
  it "show three project names" do

    project1 = Project.create(name: "Start-Up Project",
               description: "A description of a start-up project",
               target_pledge_amount: 100.00,
               pledging_ends_on: 1.day.from_now,
               website: "http://project-a.com")

    project2 = Project.create(name: "Made-Up Project",
              description: "A description of a Made-up project",
              target_pledge_amount: 200.00,
              pledging_ends_on: 3.days.from_now,
              website: "http://project-m.com")

    project3 = Project.create(name: "Spit-Up Project",
               description: "A description of a spit-up project",
               target_pledge_amount: 300.00,
               pledging_ends_on: 7.days.from_now,
               website: "http://project-c.com")

    visit projects_path
    expect(page).to have_text("3 Projects")
    expect(page).to have_text(project1.name)
    expect(page).to have_text(project2.name)
    expect(page).to have_text(project3.name)

    expect(page).to have_text(project1.description[0..9])
    expect(page).to have_text("$100.00")
    expect(page).to have_text(project1.website)
  end

end
