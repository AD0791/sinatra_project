require './config/environment'
require 'rack-flash'
class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "hotel_security"
    use Rack::Flash
  end

  get "/" do
    if logged_in?
      redirect "/clients/#{current_user.slug}"
    end
    #binding.pry
    erb :index
  end

   # independant read of all the comments
    get '/comments/about' do
        @comments = Comment.all
        #binding.pry
        erb :'comments/about'
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

#redirect_if_not_logged_in
#if !logged_in?
# redirect '/'
#end 

#def redirect_to_current_user
#      if @run.user_id != current_user.id
#        redirect "/users/#{current_user.slug}"
#      end
#    end