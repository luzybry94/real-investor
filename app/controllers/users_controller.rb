class UsersController < ApplicationController

    get '/signup' do
        erb :'users/signup'
    end

    post '/signup' do
      @user = User.new(params[:user])
      if @user.name.empty? || @user.username.empty? || @user.password.empty?
        @error = "Please fill in all fields"
        erb :'users/signup'
      elsif User.find_by(username: params[:user][:username])
        @error = "Account with that username already exists"
        erb :'users/signup'
      else
        @user.save
        session[:user_id] = @user.id
        redirect "/users/#{@user.id}"
      end
    end

    get '/users/:id' do
      @user = User.find(params[:id])
      erb :'users/show'
    end



end