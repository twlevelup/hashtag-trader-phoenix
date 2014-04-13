class Data_Manager

	def authorised?(user_name, password)
		
		tmp_valid_pass = "Valid Pass"
		isValid = 
			(userExists(user_name) &&
			password == tmp_valid_pass)
	end

	def register(values)
		raise ArgumentError, "Missing First Name" if !values.key?(:first_name)
		raise ArgumentError, "Missing Last Name" if !values.key?(:last_name)
		raise ArgumentError, "Missing Favourite Cat" if !values.key?(:favourite_cat)
		raise ArgumentError, "Missing Email" if !values.key?(:email)
		!userExists(values[:email])
	end

	private
	def userExists(user_name)		
		user_name == "Existing User"
	end

end
