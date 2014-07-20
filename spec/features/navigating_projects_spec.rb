require 'rails_helper'

describe "Navigating projects" do

  before do
    @project = Project.create(project_attributes)
  end

  it "allows navigation from the detail page to the listing page" do
    visit project_url(@project)
    click_link "All Projects"
    expect(current_url).to eq(projects_url)
  end

  it "allows navigation from the listing page to the detail page" do
    visit projects_url
    click_link @project.name
    expect(current_url).to eq(project_url(@project))
  end

end
