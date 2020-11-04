class UsersController < ApplicationController

    get '/signup' do
        erb :'users/signup'
    end

    post '/signup' do
        @user = User.new(params[:user])
        @user.save
        redirect "properties/index"
    end



end