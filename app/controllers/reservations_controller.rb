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

    get "/reservations/:id/edit" do
        @reservation = Reservation.find_by_id(params[:id])
        #binding.pry
        if logged_in?
            if @reservation.client == current_user
                erb :'/reservations/edit'
            else
                flash[:message] = "You can only edit your own reservations."
                redirect "/clients/#{current_user.slug}"
            end
        else
            redirect '/'
        end
    end

     patch '/reservations/:id' do
        @reservation = Reservation.find_by_id(params[:id])
        @reservation.client == current_user
        if params[:date] != "" && params[:occupancy]!="" && params[:room] != "" && params[:number_of_day] != "" && params[:bed_size] != ""
            @reservation.update(date: params[:date], room: params[:room], occupancy: params[:occupancy], bed_size: params[:bed_size], number_of_day: params[:number_of_day])
            flash[:message] = "Your reservation has been updated."
            redirect "/clients/#{@reservation.client.slug}"
        else
            flash[:message] = "Please enter a valid entry"
            redirect '/reservations/:id/edit'
        end

        if @reservation.client_id != current_user.id
            redirect "/clients/#{current_user.slug}"
        end
    end


=begin
    get '/reservations/:id/delete' do
    @reservation = Reservation.find(params[:id])
    if logged_in?
      if @reservation.client == current_user
        erb :'/commments/delete'
      else
        flash[:message] = "You can only delete your own reservations."
        redirect "/reservations/#{current_user.slug}"
      end
    else
      redirect '/'
    end
  end
=end

  delete '/reservations/:id' do
        @reservation = Reservation.find_by_id(params[:id])
        @reservation.client == current_user
        @reservation.destroy
        flash[:message] = "Your reservation has been deleted."
        redirect "/clients/#{@reservation.client.slug}"

        if @reservation.client_id != current_user.id
            redirect "/clients/#{current_user.slug}"
        end
  end


end
