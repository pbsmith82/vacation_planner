class UsersController < ApplicationController


    get '/signup' do

        erb :"/users/new"
    end

    post '/signup' do
        user = User.new(params[:user])
        if user.save
            session[:user_id] = user.id    
            redirect "/users/#{user.id}"

        else
            @errors = "[" + user.errors.full_messages.join(", ") + "]"
            erb :"/users/new"
        
        end
        
    end

    get '/users/:id' do
        @user = User.find(params[:id])
        erb :"/users/show"
    end



end