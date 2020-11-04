class PropertiesController < ApplicationController

    get '/properties/new' do
        erb :'properties/new'
    end

    post '/properties' do 
        @property = Property.new(params[:property])
        @property.save
        redirect '/properties/index'
    end

    get '/properties' do
        @properties = Property.all
        erb :'properties/index'
    end

    get '/properties/:id' do
        @property = Property.find(params[:id])
        erb :'properties/show'
    end

end