require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))

World NavigationHelpers

Given /^I'm on (.+)$/ do |webpage|
  visit path_to(webpage)
end