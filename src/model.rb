class TaskMaster

  def initialize
    @open_tasks = []
    @completed_tasks = []
  end
  
  def open_tasks
    @open_tasks
  end

  def completed_tasks
    @completed_tasks
  end
  
  def add(task)
    @open_tasks.push(task)
  end
  
  def complete(task)
    @open_tasks.include?(task) or raise 'No such task'
    @open_tasks.delete(task)
    @completed_tasks.unshift(task)
  end
  
  def clear_completed
    @completed_tasks = []
  end

end
