require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, 'real_investor_secret'
    register Sinatra::Flash
  end

  get "/" do
    if logged_in?
      redirect '/properties'
    else
      erb :welcome
    end
  end

  helpers do

    def logged_in?
      !!current_user
    end

    def current_user
      User.find_by(id: session[:user_id])
    end

    def authenticated?
      if !logged_in?
        redirect '/'
      end
    end
    
  end

end
