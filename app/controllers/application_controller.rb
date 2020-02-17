require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, 'yeahyeah'
  end

  helpers do
    def logged_in
      !!current_user
    end

    def current_user
      @current_user ||= Creator.find_by_id(session[:user_id]) if session[:user_id]
    end
  end
  
  get "/" do
    if logged_in
      redirect '/creators/home'
    else
      @pals = Virtpal.all
      erb :home
    end
  end

  get "/index" do
    redirect '/'
  end

end
