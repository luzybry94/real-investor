class PropertiesController < ApplicationController

    get '/properties/new' do
        if logged_in?
          erb :'properties/new'
        end
    end

    post '/properties' do 
        property = Property.new(params[:property])
        # if !property.address.empty? && property.price != nil && !property.image.empty?
        #   property.user = current_user
        if property.save
            flash[:message] = "Listing Added!"
          redirect '/properties'
        else
          flash[:error] = "Please enter an address, price and image URL."
          redirect 'properties/new'
        end
    end

    get '/properties' do
        if logged_in?
          @properties = Property.all
          erb :'properties/index'
        else
          redirect '/'
        end
    end

    get '/properties/:id' do
        @property = Property.find_by(params[:id])
        if logged_in?
            if @property.user == current_user
                erb :'properties/show'
            else
                redirect '/properties'
            end
        else
          redirect '/'
        end
    end

    get '/properties/:id/edit' do
      @property = Property.find(params[:id])
      if logged_in?
        if @property.user == current_user
            erb :'/properties/edit'
        else
            redirect "/properties/#{current_user.id}"
        end
      else
        redirect '/'
      end
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

end