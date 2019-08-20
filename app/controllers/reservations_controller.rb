class ReservationsController < ApplicationController
    get '/reservations/new' do
        if !logged_in?
            redirect '/'
        end
        erb :'/reservations/new'
    end

    post '/reservations' do
        #binding.pry
        params[:date] != "" && params[:occupancy]!="" && params[:room] != "" && params[:number_of_day] != "" && params[:bed_size] != ""
        params[:client_id] = current_user.id
        @reservation = Reservation.create(params)
        flash[:message] = "Your reservation  has been added"
        redirect "/clients/#{@reservation.client.slug}"
        if @reservation.client_id != current_user.id
            redirect "/clients/#{current_user.slug}"
        end
    end
end
