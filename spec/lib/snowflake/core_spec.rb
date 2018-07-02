require "spec_helper"
require "lib/snowflake/core.rb"

describe Snowflake::Core do
  Given(:klass) { Snowflake::Core }
  context "it can be initialized" do
    When(:instance) { klass.new }
    Then { instance != nil }
  end
end
