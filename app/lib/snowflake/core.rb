require "uri"
module Snowflake
  class Core
    def initialize(name:, title:, milestones:)
      @name = name
      @title = title
      @milestones = milestones
    end

    def to_params
      (@milestones.values + [URI.escape(@name)] + [URI.escape(@title)]).join(",")
    end
  end
end
