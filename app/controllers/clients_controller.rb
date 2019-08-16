class ClientsController < ApplicationController
    get '/login' do
        erb :'clients/login'
    end

end
