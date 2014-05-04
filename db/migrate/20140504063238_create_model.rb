class CreateModel < ActiveRecord::Migration
 def up
   		create_table :user_details do |t|
   			t.string :first_name
   			t.string :last_name
   			t.string :email
   			t.string :cat
   			t.string :user_name
   			t.string :user_type
   		end
   	end

   	def down
   		drop_table :user_details
   	end
end