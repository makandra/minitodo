require 'sinatra'
require_relative 'task_list'

list = TaskList.new

get '/' do
  @open_tasks = list.open_tasks
  @completed_tasks = list.completed_tasks
  erb :list
end

get '/add' do
  list.add(params['task'])
  redirect to('/')
end

get '/complete' do
  list.complete(params['task'])
  redirect to('/')
end

get '/clear_completed' do
  list.clear_completed
  redirect to('/')
end
