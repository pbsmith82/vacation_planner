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

    get '/users' do
        if logged_in?
            redirect "/users/#{current_user.id}"
        else
            redirect "/"
        end
    end

    get '/users/new' do 

        erb :"users/new"
    end

    get '/users/:id/edit' do
        @user = User.find(params[:id])
        erb :"/users/edit"
    end

    get '/users/:id' do
        @user = User.find(params[:id])
        @cabins = Cabin.where(user_id: params[:id]) 
       
        erb :"/users/show"
    end

    get '/login' do
        redirect "/users/login"
    end

    get '/logout' do
        session.clear
        redirect '/'
    end

    post '/login' do
        user = User.find_by(email: params[:user][:email])
        if user && user.authenticate(params[:user][:password])
            session[:user_id] = user.id
            redirect to "/cabins"
        else
            redirect to "/login"
        end

    end


end