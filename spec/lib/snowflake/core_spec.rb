require "spec_helper"
require "lib/snowflake/core.rb"

describe Snowflake::Core do
  Given(:klass) { Snowflake::Core }
  context "it transforms milestones into a url" do
    Given(:name) { "Cersei Lannister" }
    Given(:title) { "Staff Engineer" }
    Given(:milestones) {
      {
        mobile: 1,
        web_client: 2,
        foundations: 3,
        servers: 2,
        project_management: 4,
        communication: 1,
        craft: 1,
        initiative: 4,
        career_development: 3,
        org_design: 2,
        wellbeing: 0,
        accomplishment: 4,
        mentorship: 2,
        evangelism: 2,
        recruiting: 3,
        community: 0,
      }
    }
    When(:instance) { klass.new(name: name, title: title, milestones: milestones) }
    Then { instance.to_params == "1,2,3,2,4,1,1,4,3,2,0,4,2,2,3,0,Cersei%20Lannister,Staff%20Engineer" }
  end
end
