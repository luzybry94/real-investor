class SessionsController < ApplicationController

    get '/login' do
        erb :'sessions/login'
    end

    post '/login' do
      if params[:user][:username].empty? || params[:user][:password].empty?
          @error = "Please fill in your username and password"
          erb :'sessions/login'
      else
        @user = User.find_by(username: params[:user][:username])
        if @user && @user.authenticate(params[:user][:password])
          session[:user_id] = @user.id
          redirect '/properties'
        else
          @error = "Invalid Credentials"
          erb :'sessions/login'
        end
      end
    end

    get '/logout' do
        session.clear
        redirect '/'
    end

end

