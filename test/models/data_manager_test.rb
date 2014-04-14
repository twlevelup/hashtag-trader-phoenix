require 'minitest/spec'
require 'minitest/autorun'
require_relative '../minitest_helper'
require_relative '../../lib/app_code/data_manager'
require_relative '../../lib/app_code/model/user_details'

describe Data_Manager do

  let(:data_mgr) {Data_Manager.new}
   describe "when checking user name and password" do
	it "returns a failure when an invalid password is passed" do
		data_mgr.authorised?('AliceCarroll', 'invalid').must_equal false	
	end
	it "returns a failure when an invalid user name is passed" do
  	    data_mgr.authorised?('invalid', 'Valid Pass').must_equal false	
  	end  
	it "returns a success when valid details are provided" do
	  	data_mgr.authorised?('AliceCarroll', 'Valid Pass').must_equal true	
	end
  end

  let(:new_user) {User_Details.new("John","Snow","somedude@thewall","Leopard","JohnSnow")}
  let(:existing_user) {User_Details.new("Alice","Carroll","looking.glass@the","Cheshire","AliceCarroll")}

  describe "when creating a user entry" do
	
	it  "returns an exception if no user object is provided" do
		Proc.new {data_mgr.register('')}.must_raise ArgumentError		
	end	
	it "returns a failure if the user already exists" do

		data_mgr.register(existing_user).must_equal false
	end	
	it "returns a success if the user is registered" do
		data_mgr.register(new_user).must_equal true
	end		
  end
  
  describe "when getting a user entry" do
  	it "returns a user details object if a valid name is provided" do
		data_mgr.userDetails("AliceCarroll").must_be_kind_of User_Details
  	end
  	it "returns nothing if no valid name is provided" do
		data_mgr.userDetails("").must_be_kind_of NilClass
	end

  end

end