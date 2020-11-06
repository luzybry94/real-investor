class UsersController < ApplicationController

    get '/signup' do
        erb :'users/signup'
    end

    post '/signup' do
      user = User.new(params[:user])
      if user.save
        session[:user_id] = user.id
        flash[:message] = "Welcome to Real Investor! You're gonna love it!"
        redirect "/users/#{user.id}"
      else
        flash[:error] = "Error: #{user.errors.full_messages.to_sentence}"
        redirect '/signup'
      end
    end

    get '/users/:id' do
      if logged_in?
        if current_user.id.to_s == params[:id]
          @user = User.find(params[:id])
          erb :'users/show'
        else
          redirect "/users/#{current_user.id}"
        end
      else
        redirect '/'
      end
    end



end