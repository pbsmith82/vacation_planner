class UsersController < ApplicationController


    get '/signup' do

        erb :"/users/new"
    end

    post '/signup' do
        @user = User.new(params[:user])
        @user.save
        session[:user_id] = @user.id    
        redirect "/users/show"
    end

    get '/users/show' do
        @user = User.find(session[:user_id])
   
        erb :"users/show"
    end



end