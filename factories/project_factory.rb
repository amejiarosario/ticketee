FactoryGirl.define do
  factory :project do
    sequence(:name){|n| "project_name##{n}" }
  end
end