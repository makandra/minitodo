require 'sinatra'
require_relative 'model'

list = TaskList.new
list.add 'Sugar'
list.add 'Milk'
list.add 'Honey'

get '/' do
  @tasks = list.tasks
  erb :list
end

get '/add' do
  list.add(params['description'])
  redirect to('/')
end

get '/complete' do
  list.complete(params['description'])
  redirect to('/')
end

get '/clear_completed' do
  list.clear_completed
  redirect to('/')
end

