class VirtpalController < ApplicationController

  get '/virtpals/new' do

    erb :'/virtpals/new'
  end

  post '/virtpals' do
    
    redirect '/virtpals/:id'
  end

  get '/virtpals/:id/edit' do

    erb :'/virtpals/edit'
  end

  patch '/virtpals/:id' do

    redirect '/virtpals/:id'
  end

  delete '/virtpals/:id' do

    redirect '/virtpals'
  end

  get '/virtpals' do
    logged_in ? (erb :'/creators/home') : (redirect '/')
  end
  
  get '/virtpals/index' do
    logged_in ? (erb :'/creators/home') : (redirect '/')
  end

end