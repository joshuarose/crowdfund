module ProjectsHelper
  def format_pledge_date project
    if project.expired?
      "All Done!"
    else
      time_ago_in_words(project.pledging_ends_on)
    end
  end
end
