class CreatorController < ApplicationController

  get '/signup' do
    logged_in ? (redirect '/creators/home') : (erb :'/creators/new')
  end

  post '/signup' do
    if params[:email] == "" || params[:password] == ""
      redirect to '/signup'
      flash[:message] = "Please enter email and password to sign in"
    else
      @creator = Creator.create(params)
      session[:user_id] = @creator.id
      redirect '/creators/home'
      flash[:message] = "Congratulations! You are now a virtpal creator!"
    end
  end
  
  get '/login' do
    logged_in ? (redirect '/creators/home') : (erb :'/creators/login')
  end

  post '/login' do
    @creator = Creator.find_by_email(params[:email])
    if @creator and @creator.authenticate(params[:password])
      session[:user_id] = @creator.id
      redirect '/creators/home'
      flash[:message] = "Welcome back!"
    else
      redirect '/signup'
      flash[:message] = "The email and/or password you provided are not on file"
    end
  end

  get '/logout' do
    session.destroy if logged_in
    redirect '/'
  end

  get '/creators/home' do
    if logged_in
      @creator = current_user
      erb :'/creators/home'
    else
      redirect '/login'
      flash[:message] = "You are not logged in"
    end
  end

  get '/creators/:id/edit' do
    if logged_in
      @creator = current_user
      erb :'/creators/edit'
    else
      redirect '/login'
      flash[:message] = "You are not logged in"
    end
  end

  patch '/creators/:id' do
    if logged_in
      current_user.update(params)
      erb :'/creators/edit'
      flash[:message] = "Your changes have been saved"
    else
      redirect '/login'
      flash[:message] = "You are not logged in"
    end
  end

end