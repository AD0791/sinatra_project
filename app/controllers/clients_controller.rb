class ClientsController < ApplicationController
    # Entry point = SignUP
    get '/clients/signup' do
        if !logged_in?
            erb :'/clients/signup'  
        else
            redirect "/clents/#{current_user.slug}" 
        end
    end




    
    
 ###############################

    # Entry point = LOGIN
    get '/clients/login' do
        if !logged_in?
            erb :'clients/login'
        else
            redirect "/clients/#{current_user.slug}"
        end
    end

    ### login form
    post '/clients/login' do
        if !Client.exists?(username: params[:username])
         flash[:message] = "Invalid username. Please create an account."
            redirect '/clients/signup'
        else 
            @client = Client.find_by(username: params[:username])
            if @client.authenticate(params[:password])
                session[:client_id] = @client.id
                redirect "/clients/#{@client.slug}"
            else
                flash[:message] = "Sorry, that password is not valid."
                redirect '/clients/login'
            end    
        end
    end

    ### Handle the logout inside the show page
    ### later we will put it in the navbar
    get '/clients/logout' do
        session.clear
        redirect '/' 
    end

    # the show page
    get '/clients/:slug' do
        @client = current_user
        #redirect_if_not_logged_in
        if !logged_in?
            redirect '/'
        end 
        erb :'/clients/show'
    end
end
