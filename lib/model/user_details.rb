require 'sinatra/activerecord'

class User_Details < ActiveRecord::Base
      attr_reader :first_name, :last_name, :email, :cat, :user_name, :user_type 
end