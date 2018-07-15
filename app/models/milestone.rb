class Milestone < ApplicationRecord
  belongs_to :employee

  def to_url
    params = Snowflake::Core.new(
      name: employee.name,
      title: employee.title,
      milestones: {
        mobile: mobile,
        web_client: web_client,
        foundations: foundations,
        servers: servers,
        project_management: project_management,
        communication: communication,
        craft: craft,
        initiative: initiative,
        career_development: career_development,
        org_design: org_design,
        wellbeing: wellbeing,
        accomplishment: accomplishment,
        mentorship: mentorship,
        evangelism: evangelism,
        recruiting: recruiting,
        community: community,
      },
    ).to_params
    app_url = "http://cgm.mindvalley.net/#"

    "#{app_url + params}"
  end
end
