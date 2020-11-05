class SessionsController < ApplicationController

    get '/login' do
        erb :'sessions/login'
    end

    post '/login' do
      if params[:user][:username].empty? || params[:user][:password].empty?
          flash[:error] = "Please fill in your username and password"
          redirect '/login'
      else
        user = User.find_by(username: params[:user][:username])
        if user && user.authenticate(params[:user][:password])
          session[:user_id] = user.id
          flash[:message] = "Welcome back, #{user.username}!"
          redirect '/properties'
        else
          flash[:error] = "Invalid Credentials"
          redirect '/login'
        end
      end
    end

    get '/logout' do
        session.clear
        flash[:message] = "Goodbye for now!"
        redirect '/'
    end

end

