Given /^there are the following users:$/ do |table|
	table.hashes.each do |attributes|
		unconfirmed = attributes.delete("unconfirmed") == "true"
		@user = User.create!(attributes)
		@user.update_attribute("admin", attributes["admin"] == "true")
		@user.confirm! unless unconfirmed
	end
end