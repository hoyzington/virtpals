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
    if logged_in
      @pal = Virtpal.find_by_id(params[:id])
      erb :'/virtpals/edit'
    else
      redirect '/login'
    end
  end

  patch '/virtpals/:id' do
    if logged_in
      params[:id].update(params)
      redirect '/virtpals/:id/edit'
    else
      redirect '/login'
    end
  end

  delete '/virtpals/:id' do
    if logged_in
      Virtpal.find_by_id(params[:id]).destroy
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