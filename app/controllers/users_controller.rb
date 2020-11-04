class UsersController < ApplicationController

    get '/signup' do
        erb :'users/signup'
    end

    post '/signup' do
        @user = User.new(params[:user])
        @user.save
        session[:user_id] = @user.id
        redirect "properties/index"
    end



end