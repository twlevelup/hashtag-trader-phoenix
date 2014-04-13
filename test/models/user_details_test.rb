require 'minitest/spec'
require 'minitest/autorun'
require_relative '../minitest_helper'
require_relative '../../lib/app_code/model/user_details.rb'

describe User_Details do
  
 let(:first_name){"John"}
 let(:last_name){"Snow"}
 let(:email){"somedude@thewall"}
 let(:cat){"Leopard"}
 let(:user_name){"JohnSnow"}

  describe "when creating a user entry" do
	it "returns an exception if no first name is provided" do
		Proc.new {User_Details.new("", last_name, email, cat, user_name)}.must_raise ArgumentError		
	end	
	it "returns an exception if no last name is provided" do
		Proc.new {User_Details.new(first_name, "", email, cat, user_name)}.must_raise ArgumentError			
	end	
		it "returns an exception if no email is provided" do
		Proc.new {User_Details.new(first_name, last_name, "", cat, user_name)}.must_raise ArgumentError				
	end		
	it "returns an exception if no cat is provided" do
		Proc.new {User_Details.new(first_name, last_name, email, "", user_name)}.must_raise ArgumentError				
	end	
	it "returns an exception if no user name is provided" do
		Proc.new {User_Details.new(first_name, last_name, email, cat, "")}.must_raise ArgumentError				
	end	
  end
end