require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "Session_Secret"
  end

  get "/" do
    erb :home
  end

  get '/logout' do
    session.clear
    redirect '/'
  end


  helpers do

    def logged_in?
      !!session[:user_id]
    end

    def current_user
      @current_user ||= User.find(session[:user_id])
    end

  end

end
