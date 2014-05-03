require_relative 'model/user_details'

# DM - Designed as an adapter between business objects and persistant storage classes
#    - Currently uses tmp data. 
# 	 - May need to be modified into a facade for more targetted classes as it grows.
class Data_Manager

	def initialize()
		@db		#this is where the connection to the db is to be held

	end	

	def register(user_details)
		raise ArgumentError, "User details not provided:" if user_details.class != User_Details
		!userExists?(user_details.user_name)
	end

	def userDetails(user_name)		
		userExists?(user_name) ?
			User_Details.new("Alice","Carroll","looking.glass@the","Cheshire","AliceCarroll", "power") 
			: nil
	end

	def userExists?(user_name)		
        # list of valid user names (until they go in the db)
        validNames = ["wsutina","AliceCarroll"]
        validNames.include? user_name
	end

end
