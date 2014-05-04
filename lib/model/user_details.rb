require 'sinatra/activerecord'

class User_Details < ActiveRecord::Base

      attr_reader :first_name, :last_name, :email, :cat, :user_name, :user_type

      def initialize(first_name, last_name, email, cat, user_name, user_type)

		raise ArgumentError, "Missing First Name" if first_name == ""
		raise ArgumentError, "Missing Last Name" if last_name == ""
		raise ArgumentError, "Missing Favourite Cat" if cat == ""
		raise ArgumentError, "Missing Email" if email == ""
		raise ArgumentError, "Missing User Name" if user_name == ""
            raise ArgumentError, "Missing User Type" if user_type == ""

            @first_name = first_name
            @last_name = last_name
            @email = email
            @cat = cat
            @user_name = user_name
            @user_type = user_type
       end
 
end