Given /^there are the following users:$/ do |table|
  # table is a Cucumber::Ast::Table
  table.hashes.each do |a|
    unconfirmed = a.delete("unconfirmed") == true
    @user = User.create!(a)
    @user.confirm! unless unconfirmed
  end
end
