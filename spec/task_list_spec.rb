require 'task_list'

describe TaskList do

  describe 'new' do

    it 'creates a new to-do list with no open tasks' do
      list = TaskList.new
      expect(list.open_tasks).to eq []
    end

  end

  describe 'add' do
    
    it 'adds the given task to the list of open tasks' do
      list = TaskList.new
      list.add('Milk')
      list.add('Sugar')
      expect(list.open_tasks).to eq ['Milk', 'Sugar']
    end

  end
  
  describe 'complete' do
    
    it 'finds the task with the given description and marks it as completed' do
      list = TaskList.new
      list.add('Milk')
      list.add('Sugar')
      list.complete('Milk')
      expect(list.open_tasks).to eq ['Sugar']
      expect(list.completed_tasks).to eq ['Milk']
    end
    
    it 'raises an error if there is no task with the given description' do
      list = TaskList.new
      expect { list.complete('Unknown task') }.to raise_error('No such task')
    end
    
  end
  
  describe 'clear_completed' do
  
    it 'removes all completed tasks' do
      list = TaskList.new
      list.add('Milk')
      list.add('Sugar')
      list.complete('Milk')
      list.clear_completed
      expect(list.open_tasks).to eq ['Sugar']
      expect(list.completed_tasks).to be_empty
    end
  
  end

end


