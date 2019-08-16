class CommentsController < ApplicationController
    get '/about' do
        erb :'comments/about'
    end
end
