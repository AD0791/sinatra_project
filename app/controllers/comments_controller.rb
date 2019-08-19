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
        #binding.pry
        @comment = Comment.create(params)
        flash[:message] = "Your comment has been added"
        #binding.pry
        redirect "/clients/#{@comment.client.slug}"
        if @comment.client_id != current_user.id
            redirect "/clients/#{current_user.slug}"
        end
    end

    # Edit situation
    get '/comments/:id/edit' do
        @comment = Comment.find_by_id(params[:id])
        #@comments = Comment.all
        #binding.pry
        if logged_in?
            if @comment.client == current_user
                erb :'/comments/edit'
            else
                flash[:message] = "You can only edit your own comments."
                redirect "/clients/#{current_user.slug}"
            end
        else
            redirect '/'
        end
    end

    patch '/comments/:id' do
        @comment = Comment.find_by_id(params[:id])
        @comment.client == current_user
        if params[:comment] != ""
            @comment.update(comment: params[:comment])
            flash[:message] = "Your comment has been updated."
            redirect "/clients/#{@comment.client.slug}"
        else
            flash[:message] = "Please enter a valid comment"
            redirect '/comments/:id/edit'
        end

        if @comment.client_id != current_user.id
            redirect "/clients/#{current_user.slug}"
        end
    end

=begin
    get '/comments/:id/delete' do
    @comment = Comment.find(params[:id])
    if logged_in?
      if @comment.client == current_user
        erb :'/commments/delete'
      else
        flash[:message] = "You can only delete your own comments."
        redirect "/comments/#{current_user.slug}"
      end
    else
      redirect '/'
    end
  end
=end

  delete '/comments/:id' do
        @comment = Comment.find_by_id(params[:id])
        @comment.client == current_user
        @comment.destroy
        flash[:message] = "Your comment has been deleted."
        redirect "/clients/#{@comment.client.slug}"

        if @comment.client_id != current_user.id
            redirect "/clients/#{current_user.slug}"
        end
  end


end
