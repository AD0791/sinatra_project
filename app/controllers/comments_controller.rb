class CommentsController < ApplicationController
    get '/comments/about' do
        erb :'comments/about'
    end
end
