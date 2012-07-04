FactoryGirl.define do
  factory :ticket do
  	sequence(:title){|n| "Ticket Title #{n}" }
  	description "This is the ticket description.... bla blah"
  end
end