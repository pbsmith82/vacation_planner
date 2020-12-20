class CabinsController < ApplicationController

    get '/cabins' do
        @cabins = Cabin.all
        erb :"cabins/index"
    end

    get '/cabins/new' do
        erb :"cabins/new"
    end

    get '/cabins/:id' do
        @cabin = Cabin.find(params[:id])
        erb :"/cabins/show"
    end

    get '/cabins/:id/edit' do
        #binding.pry
        @cabin = Cabin.find(params[:id])
        erb :"/cabins/edit"
    end

    post '/cabins/new' do
        cabin = Cabin.create(params[:cabin])

        redirect "/cabins/#{cabin.id}"
    end

end