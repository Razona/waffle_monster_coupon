require 'bundler/setup'
Bundler.require
require 'sinatra/reloader' if development?
require 'sinatra/activerecord'
require './models'
require 'net/http'
require 'uri'

get '/' do
    erb :index
end

get '/coupon_gen' do
    erb :coupon_gen
end

get '/clear' do
    erb :clear
end

post '/gen' do
    Coupon.create!(coupon_code: params[:coupon_gen],mode: false)
    redirect '/list'
end

get '/qr_gen' do
    Coupon.create!(coupon_code: params[:coupon_gen],mode: false)
    @code = params[:coupon_gen]
    erb :qr_gen
end

get '/list' do
    @list = Coupon.all
    erb :list
end



post '/coupon' do

     @code = params[:coupon_code]
     c = Coupon.find_by(coupon_code: params[:coupon_code])
     @mode = c.mode
     

    coupon = Coupon.find_by(coupon_code: params[:coupon_code])
    coupon.mode = true
    coupon.save

     
     @list = Coupon.all
    erb :check
end

get '/qr_use' do
    @code = params[:coupon_code]
     c = Coupon.find_by(coupon_code: params[:coupon_code])
     @mode = c.mode
     

    coupon = Coupon.find_by(coupon_code: params[:coupon_code])
    coupon.mode = true
    coupon.save

     
     @list = Coupon.all
    erb :check
end
