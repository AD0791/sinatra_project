require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
     set :session_secret, "hotel_security"
  end

  get "/" do
    
    #binding.pry
    
    erb :index
  end


  # helper method
  helpers do
    def logged_in?
      !!session[:client_id]
    end

    def current_user
      Client.find(session[:client_id])
    end
  end

end
