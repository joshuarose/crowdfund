require 'rails_helper'

describe "Project" do
  it "expired to be true for past projects" do
    project = Project.create(pledging_ends_on: 3.days.ago)
    expect(project.expired?).to eq(true)
  end

  it "expired to be false for future projects" do
    project = Project.create(pledging_ends_on: 3.days.from_now)
    expect(project.expired?).to eq(false)
  end
end
