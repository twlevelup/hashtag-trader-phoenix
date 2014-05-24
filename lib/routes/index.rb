module HashTagTrader
  module Routes
    module Index
      def self.registered(app)
        app.get '/' do        	
          haml :index, :layout => :layout3
        end
      end
    end
  end
end
