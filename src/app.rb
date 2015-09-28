require 'sinatra'
require_relative 'model'

task_manager = TaskManager.new

get '/' do
  @open_tasks = task_manager.open_tasks
  @completed_tasks = task_manager.completed_tasks
  erb :list
end

get '/add' do
  task_manager.add(params['task'])
  redirect to('/')
end

get '/complete/:task' do
  task_manager.complete(params['task'])
  redirect to('/')
end

get '/clear_completed' do
  task_manager.clear_completed
  redirect to('/')
end
