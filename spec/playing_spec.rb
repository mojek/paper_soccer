require "rails_helper"

path = Rails.root.join("playing/spec")
Dir.glob("#{path}/**/*_spec.rb") do |file|
  require file
end
