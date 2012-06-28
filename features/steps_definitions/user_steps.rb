Given /^the are the following users:$/ do |table|
  # table is a Cucumber::Ast::Table
  table.hashes.each do |a|
    @user = User.create!(a)
  end
end