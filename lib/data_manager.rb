require_relative 'model/user_details'

# DM - Designed as an adapter between business objects and persistant storage classes
#    - Currently uses tmp data. 
# 	 - May need to be modified into a facade for more targetted classes as it grows.
class Data_Manager

	def register(details)
		 User_Details.create(
             first_name: details["first_name"],
             last_name: details["last_name"],
             email: details["email"],
             cat: details["cats"],
             user_name: details["user_name"],
             user_type: details["user_type"])
	end

	def userDetails(user_name)		
		userExists?(user_name) ?
			User_Details.find_by(user_name: user_name): nil
	end

	def userExists?(user_name)

	begin
		user = User_Details.find_by(user_name: user_name)
		return user.class != NilClass
		rescue ActiveRecord::RecordNotFound
		return false
	end
end

end
