require 'model'

describe TaskList do

  describe 'add' do
    
    it 'adds the given task to the list' do
      list = TaskList.new
      list.add 'Milk'
      list.add 'Sugar'
      expect(list.tasks.size).to eq(2)
      expect(list.tasks[0].description).to eq('Milk')
      expect(list.tasks[1].description).to eq('Sugar')
    end
    
    it 'marks the new task as to-do' do
      list = TaskList.new
      list.add 'Milk'
      expect(list.tasks[0].completed?).to eq(false)
    end
    
  end
  
  describe 'complete' do
    
    it 'finds the task with the given description and marks it as completed' do
      list = TaskList.new
      list.add('Milk')
      list.add('Sugar')
      list.complete('Milk')
      expect(list.tasks[0].completed?).to eq(true)
      expect(list.tasks[1].completed?).to eq(false)
    end
    
    it 'raises an error if there is no task with the given description' do
      list = TaskList.new
      expect { list.complete('Unknown task') }.to raise_error('No such task')
    end
    
  end
  
  describe 'clear_completed' do
  
    it 'removes completed tasks from the list' do
      list = TaskList.new
      list.add('Milk')
      list.add('Sugar')
      list.complete('Milk')
      list.clear_completed
      expect(list.tasks.size).to eq(1)
      expect(list.tasks[0].description).to eq('Sugar')
    end
  
  end

end

