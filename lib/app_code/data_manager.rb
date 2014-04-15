require_relative 'model/user_details'

# DM - Designed as an adapter between business objects and persistant storage classes
#    - Currently uses tmp data. 
# 	 - May need to be modified into a facade for more targetted classes as it grows.
class Data_Manager

	def authorised?(user_name, password)		
		tmp_valid_pass = "Valid Pass"		 
		(userExists?(user_name) && password == tmp_valid_pass)
	end

	def register(user_details)
		raise ArgumentError, "User details not provided:" if user_details.class != User_Details
		!userExists?(user_details.getUserName)
	end

	def userDetails(user_name)		
		userExists?(user_name) ?
			User_Details.new("Alice","Carroll","looking.glass@the","Cheshire","AliceCarroll") 
			: nil
	end

	private
	def userExists?(user_name)		
		user_name == "AliceCarroll"
	end

end
