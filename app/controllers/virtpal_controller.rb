require 'pry'

class VirtpalController < ApplicationController

  get '/virtpals/new' do
    logged_in ? (erb :'/virtpals/new') : (redirect '/login')
  end

  post '/virtpals' do
    if logged_in
      pal = Virtpal.new(params)
      pal.creator = Creator.find_by_id(session[:user_id])
      pal.save
      redirect '/creators/home'
    else
      redirect '/login'
    end
  end

  get '/virtpals/:id/edit' do
    if logged_in
      @pal = Virtpal.find_by_id(params[:id])
#binding.pry
      if @pal.creator_id == session[:user_id]
        erb :'/virtpals/edit'
      else
        redirect '/creators/home'
      end
    else
      redirect '/login'
    end
  end

  patch '/virtpals/:id' do
    if logged_in
      if params[:vp][:name] == ""
        redirect to "/virtpals/#{params[:id]}/edit"
      else
        @pal = Virtpal.find_by_id(params[:id])
 #binding.pry
        if @pal and @pal.creator == current_user
          @pal.update(params[:vp])
          redirect "/virtpals/#{@pal.id}/edit"
        else
          redirect '/creators/home'
        end
      end
    else
      redirect '/login'
    end
  end

  get '/virtpals/:id' do
    @pal = Virtpal.find_by_id(params[:id])
    erb :'/virtpals/show'
  end

  delete '/virtpals/:id' do
    if logged_in
      Virtpal.find_by_id(params[:id]).destroy
      redirect '/creators/home'
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