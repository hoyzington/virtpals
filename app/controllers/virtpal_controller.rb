class VirtpalController < ApplicationController

  get '/virtpals/new' do
    logged_in ? (erb :'/virtpals/new') : (redirect '/login')
  end

  post '/virtpals' do
    if logged_in
      Virtpal.create(params)
      redirect '/creators/home'
    else
      redirect '/login'
    end
  end

  get '/virtpals/:id/edit' do
    logged_in ? (erb :'/virtpals/edit') : (redirect '/login')
  end

  patch '/virtpals/:id' do
    if logged_in
      
      redirect '/virtpals/:id'
    else
      redirect '/login'
    end
  end

  delete '/virtpals/:id' do
    if logged_in
      
      redirect '/virtpals'
    else
      redirect '/login'
    end
  end

  get '/virtpals' do
    logged_in ? (erb :'/creators/home') : (redirect '/')
  end
  
  get '/virtpals/index' do
    logged_in ? (erb :'/creators/home') : (redirect '/')
  end

end