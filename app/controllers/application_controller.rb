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
      @current_user ||= Creator.find_by(id: session[:user_id]) if session[:user_id]
    end
  end
  
  get "/" do
    logged_in ? (erb :'/creators/home') : (erb :home)
  end

  get "/index" do
    redirect '/'
  end

end
