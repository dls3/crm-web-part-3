require_relative 'contact'
require 'sinatra'

get '/' do
  erb :index
end

get '/home' do
  redirect to('/')
end

get '/contacts' do
  @contacts = Contact.all
  erb :contacts
end

get '/about' do
  erb :about
end

get '/contacts/:id' do
  @contacts = Contact.all
  @contact = Contact.find_by(id: params[:id].to_i)
  if @contact
    erb :show_contact
  else
    raise Sinatra::NotFound
  end
end

after do
  ActiveRecord::Base.connection.close
end
