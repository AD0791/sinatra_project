class ReservationsController < ApplicationController
    get '/reservations/new' do
        if !logged_in?
            redirect '/'
        end
        erb :'/reservations/new'
    end
end
