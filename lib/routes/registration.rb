module HashTagTrader
  module Routes
    module Registration
      def self.registered(app)
        app.get '/Register' do
         haml :registration
        end
        app.get '/Terms' do
    	   haml :tandc
        end
      end
    end
  end
end
