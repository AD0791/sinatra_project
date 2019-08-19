class CommentsController < ApplicationController
    

    # logged in situation
   get '/comments/new' do
        if !logged_in?
            redirect '/'
        end
        erb :'/comments/new'
    end

    # create a new comment
    post '/comments' do
        params[:comment] != ""
        params[:client_id] = current_user.id
        binding.pry
        @comment = Comment.create(params)
        flash[:message] = "Your comment has been added"
        binding.pry
        redirect '/clients/#{@comment.client.slug}'
        if @comment.client_id != current_user.id
            redirect '/clients/#{current_user.slug}'
        end
    end

  
end
