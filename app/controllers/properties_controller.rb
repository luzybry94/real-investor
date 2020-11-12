class PropertiesController < ApplicationController

    get '/properties/new' do
        authenticated?
          erb :'properties/new'
    end

    post '/properties' do
       
        @property = current_user.properties.build(params[:property])
        # if !property.address.empty? && property.price != nil && !property.image.empty?
        #   property.user = current_user
        if @property.save
            flash[:message] = "Listing Added!"
          redirect '/properties'
        else
          @error = "Please enter an address, price and image URL."
          erb :'properties/new'
        end
    end

    get '/properties' do
      authenticated?
          @properties = Property.all
          erb :'properties/index'
    end

    get '/properties/:id' do
      authenticated?
      set_property
      erb :'properties/show'
    end

    get '/properties/:id/edit' do
      authenticated?
      set_property
      erb :'/properties/edit'
    end

    patch '/properties/:id' do
        @property = Property.find(params[:id])
        # if !params[:property][:address].empty? && !params[:property][:price].empty? && !params[:property][:image].empty?
        if @property.update(params[:property])
          flash[:message] = "Listing Saved!"
          redirect "/properties/#{@property.id}"
        else
          flash[:error] = "Please enter an address, price and image URL."
          redirect "/properties/#{@property.id}/edit"
        end

    end

    delete '/properties/:id' do
        property = Property.find(params[:id])
        property.destroy
        flash[:message] = "Listing Deleted."
        redirect '/properties'
    end

    private

    def set_property
      @property = current_user.properties.find_by(id: params[:id])
        if !@property
          redirect '/properties'
        end
    end

end