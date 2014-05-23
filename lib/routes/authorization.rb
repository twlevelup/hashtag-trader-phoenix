require './lib/data_manager'
module HashTagTrader
  module Routes
    module Authorization
      def self.registered(app)
        app.get '/auth/' do
          @configuration = Configuration.new
          haml :auth, :layout => :layout2
        end

        app.post '/auth/developer/callback' do
          session[:uid] = env['omniauth.auth']['uid']
          session[:name] = env['omniauth.auth'][:info][:name]
          redirect to('/')
        end

        app.get '/auth/github/callback' do
          session[:uid] = env['omniauth.auth']['uid']
          session[:name] = env['omniauth.auth'][:info][:name]
          data_mgr = Data_Manager.new
          if data_mgr.userExists?(session[:name])
            redirect to '/' 
          else
            redirect to '/auth/Register'
          end
        end
      end
    end
  end
end