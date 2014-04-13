require 'minitest/spec'
require 'minitest/autorun'
require_relative '../minitest_helper'
require_relative '../../lib/app_code/Data_Manager.rb'

describe Data_Manager do

  let(:data_mgr) {Data_Manager.new}
   describe "when checking user name and password" do
	it "returns a failure when an invalid password is passed" do
		data_mgr.authorised?('Existing User', 'invalid').must_equal false	
	end
	it "returns a failure when an invalid user name is passed" do
  	    data_mgr.authorised?('invalid', 'Valid Pass').must_equal false	
  	end  
	it "returns a success when valid details are provided" do
	  	data_mgr.authorised?('Existing User', 'Valid Pass').must_equal true	
	end
  end

 let(:user_nofirst) {{:last_name => "Smith", :favourite_cat => "Cheshire", 
 	:email => "email.com"}}
 let(:user_nolast)  {{:first_name => "John", :favourite_cat => "Cheshire", 
 	:email => "email.com"}}
 let(:user_nocat) {{:first_name => "John", :last_name => "Smith", 
 	:email => "email.com"}}
 let(:user_noemail) {{:first_name => "John", :last_name => "Smith", 
 	:favourite_cat => "Cheshire"}}
 let(:user_exists) {{:first_name => "John", :last_name => "Smith", 
 	:favourite_cat => "Cheshire", :email => "Existing User"}}
 let(:user_new) {{:first_name => "John", :last_name => "Smith", 
 	:favourite_cat => "Cheshire", :email => "email.com"}}


  describe "when creating a user entry" do
	it "returns an exception if no first name is provided" do
		Proc.new {data_mgr.register(user_nofirst)} .must_raise ArgumentError 
	end	
	it "returns an exception if no last name is provided" do
		Proc.new {data_mgr.register(user_nolast)} .must_raise ArgumentError 
	end	
	it "returns an exception if no cat is provided" do
		Proc.new {data_mgr.register(user_nocat)} .must_raise ArgumentError 
	end	
	it "returns an exception if no email is provided" do
		Proc.new {data_mgr.register(user_noemail)} .must_raise ArgumentError 
	end	
	it "returns a failure if the user already exists" do
		data_mgr.register(user_exists).must_equal false
	end	
	it "returns a success if the user is registered" do
		data_mgr.register(user_new).must_equal true
	end	

	
  end

  describe "when getting a user entry" do

  end

end