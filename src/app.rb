require 'sinatra'
require_relative 'task_master'

master = TaskMaster.new

get '/' do
  @open_tasks = master.open_tasks
  @completed_tasks = master.completed_tasks
  erb :list
end

get '/add' do
  master.add(params['task'])
  redirect to('/')
end

get '/complete' do
  master.complete(params['task'])
  redirect to('/')
end

get '/clear_completed' do
  master.clear_completed
  redirect to('/')
end
