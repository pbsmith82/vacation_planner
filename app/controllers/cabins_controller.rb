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
        cabin = Cabin.new(params[:cabin])
        if cabin.save
            redirect "/cabins/#{cabin.id}"
        else
            @errors = "[" + cabin.errors.full_messages.join(", ") + "]"
            erb :"/cabins/new"
        end
    
    end


    patch '/cabins/:id' do
        @cabin = Cabin.find(params[:id])
        
        @cabin.update(params[:cabin])
        redirect to "/cabins/#{@cabin.id}"
    end

end