FactoryGirl.define do
  factory :project do
    name 'Ticketee'
  end

  factory :user do
  	sequence(:email){|n| "user#{n}@ticketee.com" }
  	password "password"
  	password_confirmation "password" 
  	
  	factory :admin do
  		admin true
  	end
  end

  # sequence :email do |n|
  #   "email#{n}@factory.com"
  # end

end