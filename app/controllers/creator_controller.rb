require 'pry'

class CreatorController < ApplicationController

  get '/signup' do
    logged_in ? (redirect '/creators/home') : (erb :'/creators/new')
  end

  post '/signup' do
    if params[:username] == "" || params[:password] == ""
      redirect to '/signup'
    else
      @creator = Creator.create(params)
      session[:user_id] = @creator.id
      redirect '/creators/home'
    end
  end
  
  get '/login' do
    logged_in ? (redirect '/creators/home') : (erb :'/creators/login')
  end

  post '/login' do
    @creator = Creator.find_by_username(params[:username])
    if @creator and @creator.authenticate(params[:password])
      session[:user_id] = @creator.id
      redirect '/creators/home'
    else
      redirect '/signup'
    end
  end

  get '/logout' do
    session.destroy if logged_in
    redirect '/'
  end

  get '/creators/home' do
    if logged_in
      @creator = current_user
      @pals = Virtpal.all
      erb :'/creators/home'
    else
      redirect '/login'
    end
  end

  get '/creators/:id/edit' do
    if logged_in
      @creator = current_user
      erb :'/creators/edit'
    else
      redirect '/login'
    end
  end

  patch '/creators/:id' do
    if logged_in
      current_user.update(params)
      erb :'/creators/edit'
    else
      redirect '/login'
    end
  end

end