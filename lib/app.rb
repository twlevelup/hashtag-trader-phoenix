require 'omniauth'
require 'omniauth-github'
require 'sinatra/base'
require 'sinatra/twitter-bootstrap'
require 'rack/ssl-enforcer'
require 'haml'
require 'sinatra/activerecord'

require_relative 'configuration'
require_relative 'routes/index'
require_relative 'routes/authorization'
require_relative 'routes/registration'

require_relative 'data_manager'

class HashTagTraderApp < Sinatra::Base
  set :root, File.dirname(__FILE__)
  set :static, true
  set :public, 'public'

  use Rack::SslEnforcer, :only_hosts => /.*\.herokuapp\.com$/
  set :session_secret, '97b1bbfffbd8e70979f375bde519bdc313b0a549b323cfa2ae74c615f9e42e04'

  #Enable sinatra sessions
  use Rack::Session::Cookie, :key => '_rack_session',
                             :path => '/',
                             :expire_after => 2592000, # In seconds
                             :secret => settings.session_secret


  configuration = Configuration.new
  configure do
    set :configuration, configuration
  end

  use OmniAuth::Builder do
    configuration.omniauth_providers.each do |provider_config|
      provider provider_config.id, *provider_config.parameters
    end
  end

  before do
    pass if request.path_info =~ /^\/(js|css|auth)\//

    redirect to("/auth/") unless session[:uid]
  end


  register Sinatra::Twitter::Bootstrap::Assets
  
  register HashTagTrader::Routes::Index
  register HashTagTrader::Routes::Authorization
  register HashTagTrader::Routes::Registration

  configure do
    set :data_mgr, Data_Manager.new
  end

  configure :production, :development do 
    db = URI.parse(ENV['DATABASE_URL'] || 'postgres://localhost/phoenixdev')

    ActiveRecord::Base.establish_connection(
    :adapter  => db.scheme == 'postgres' ? 'postgresql' : db.scheme,
    :host     => db.host,
    :username => db.user,
    :password => db.password,
    :database   => db.path[1..-1],
    :encoding   => 'utf8'
    )
end

end

