module HashTagTrader
  module Routes
    module Registration
      def self.registered(app)
        app.get '/auth/Register' do
         haml :registration, :layout => :layout2
        end
        app.get '/Terms' do
    	   haml :tandc
        end
      end
    end
  end
end
