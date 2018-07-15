
require "rails_helper"

describe Milestone do
  context "it generates a url from its data" do
    Given(:milestone) { create(:milestone) }
    When(:url) { milestone.to_url }
    Then { url == "http://cgm.mindvalley.net/#1,2,3,2,4,1,1,4,3,2,0,4,2,2,3,0,Cersei%20Lannister,Staff%20Engineer" }
  end
end
