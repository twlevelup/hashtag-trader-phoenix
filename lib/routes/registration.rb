require './lib/data_manager'
require './lib/model/user_details'

module HashTagTrader
  module Routes
    module Registration
      def self.registered(app)
        app.get '/auth/Register' do
         haml :registration, :layout => :layout2
        end

        app.post '/auth/Register' do
          
          data_mgr = Data_Manager.new
          unless params["termsAgreed"] == "Y" 
            redirect to('/auth/Register')
          end  
          if data_mgr.userExists?(session[:name]) 
             redirect to('/auth/Register') 
          end

          details["user_name"] = session[:name]
          details["first_name"] = params["name"]
          details["last_name"] = params["surname"]
          details["email"] = params["email"]
          details["cat"] = params["cat"]
          details["user_type"] = params["userStatus"]
         
          data_mgr.register(details)
          redirect to('/')
        end 

        app.get '/Terms' do
    	   haml :tandc
        end

      end
    end
  end
end
