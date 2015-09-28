class Task

  def initialize(description, completed)
    @description = description
    @completed = completed
  end
  
  def description
    @description
  end
  
  def completed?
    @completed
  end
  
  def complete
    @completed = true
  end

end


class TaskList

  def initialize
    @tasks = []
  end
  
  def tasks
    @tasks
  end
  
  def add(description)
    task = Task.new(description, false)
    @tasks.push(task)
  end
  
  def complete(description)
    task = @tasks.find { |t| t.description == description }
    if task.nil?
      raise 'No such task'
    end
    task.complete
  end
  
  def clear_completed
    @tasks = @tasks.reject { |t| t.completed? }
  end

end






