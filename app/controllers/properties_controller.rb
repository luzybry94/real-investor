class PropertiesController < ApplicationController

    get '/properties/new' do
        erb :'properties/new'
    end

    post '/properties' do 
        @property = Property.new(params[:property])
        @property.user = 
        if !@property.address.empty? && !@property.price.empty?
          @property.save
          redirect '/properties/index'
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
        @property.update(params[:property])
        redirect '/properties'
    end

    delete '/properties/:id' do
        @property = Property.find(params[:id])
        @property.destroy
        redirect '/properties'
    end

end