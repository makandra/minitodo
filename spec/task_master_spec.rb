require 'task_master'

describe TaskMaster do

  describe 'new' do

    it 'creates a new to-do list with no open tasks' do
      master = TaskMaster.new
      expect(master.open_tasks).to eq []
    end

  end

  describe 'add' do
    
    it 'adds the given task to the master of open tasks' do
      master = TaskMaster.new
      master.add 'Milk'
      master.add 'Sugar'
      expect(master.open_tasks).to eq ['Milk', 'Sugar']
    end

  end
  
  describe 'complete' do
    
    it 'finds the task with the given description and marks it as completed' do
      master = TaskMaster.new
      master.add('Milk')
      master.add('Sugar')
      master.complete('Milk')
      expect(master.open_tasks).to eq ['Sugar']
      expect(master.completed_tasks).to eq ['Milk']
    end
    
    it 'raises an error if there is no task with the given description' do
      master = TaskMaster.new
      expect { master.complete('Unknown task') }.to raise_error('No such task')
    end
    
  end
  
  describe 'clear_completed' do
  
    it 'removes all completed tasks' do
      master = TaskMaster.new
      master.add('Milk')
      master.add('Sugar')
      master.complete('Milk')
      master.clear_completed
      expect(master.open_tasks).to eq ['Sugar']
      expect(master.completed_tasks).to be_empty
    end
  
  end

end


