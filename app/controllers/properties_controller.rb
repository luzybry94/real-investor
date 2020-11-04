class PropertiesController < ApplicationController

    get '/properties/new' do
        if logged_in?
          erb :'properties/new'
        end
    end

    post '/properties' do 
        property = Property.new(params[:property])
        if !property.address.empty? && property.price != nil
          property.user = current_user
          property.save
          redirect '/properties'
        else
          @error = "Please enter an address and price"
          erb :'properties/new'
        end
    end

    get '/properties' do
        @properties = Property.all
        erb :'properties/index'
    end

    get '/properties/:id' do
        @property = Property.find(params[:id])
        erb :'properties/show'
    end

    get '/properties/:id/edit' do
        @property = Property.find(params[:id])
        erb :'/properties/edit'
    end

    patch '/properties/:id' do
        @property = Property.find(params[:id])
        if !params[:property][:address].empty? && !params[:property][:price].empty? 
          @property.update(params[:property])
          redirect '/properties'
        else
            @error = "Please enter an address and price"
            erb :'/properties/edit'
        end

    end

    delete '/properties/:id' do
        property = Property.find(params[:id])
        property.destroy
        redirect '/properties'
    end

end