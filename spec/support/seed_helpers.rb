module SeedHelpers
	def create_user!(attributes={})
		user = create(:user, attributes)
		user.confirm!
		user
	end
end