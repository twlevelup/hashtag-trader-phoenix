module HashTagTrader
  module Routes
    module Index
      def self.registered(app)
        app.get '/' do        	
          haml :index, :layout => :dashboard_layout
        end
      end
    end
  end
end
