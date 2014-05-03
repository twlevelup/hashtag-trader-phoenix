module HashTagTrader
  module Routes
    module Authorization
      def self.registered(app)
        app.get '/auth/' do
          @configuration = Configuration.new
          haml :auth
        end

        app.post '/auth/developer/callback' do
          session[:uid] = env['omniauth.auth']['uid']
          session[:name] = env['omniauth.auth'][:info][:name]

          redirect to('/')
        end

        app.get '/auth/github/callback' do
          session[:uid] = env['omniauth.auth']['uid']
          session[:name] = env['omniauth.auth'][:info][:name]
          
          data_mgr = settings.data_mgr
          redirect to('/') if data_mgr.userExists?(session[:name])
        end

# this is to allow spoofing a user's access until we have the database functional
        app.get '/auth/spoof' do
          session[:name] = params["name"]          
          data_mgr = settings.data_mgr
          redirect to('/') if data_mgr.userExists?(session[:name])

          redirect to('/auth/Register')
        end



      end
    end
  end
end