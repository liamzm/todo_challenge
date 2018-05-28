# Pre-configurations (Change if you want an awesome difficulty assessment)
require_relative 'config/application'

# Your Code begins from this line onwards #


p "These are your options".ljust(20)

p "*".ljust(50, '*')

p "To list all tasks, type: list".ljust(20)
p "To add an item, type: add".ljust(20)
p "To exit, type: exit".ljust(20)




def inputs

loop do



  p "Type your command here"
  input = gets.chomp



  if input == "list"
    Task.all.each {|t| p t}

  elsif input == "add"


    tasklist = Task.all.to_a

    if tasklist.count > 4
      p "You are too busy. Please remove a task before adding more"
      inputs

    else

    p "What's the name of the task?"
    taskname = gets.chomp.to_s
    p "What is the status of this task?"
    status = gets.chomp.to_s
    
    newtask = Task.new(description: taskname, status: status)
    newtask.save

    tasklist = Task.all.to_a

    newtask.update(task_number: (tasklist.index(newtask)+ 1))


    
    p "Your task has been added"
  end



  elsif input == "remove" || input == "delete"


    p "Insert task number"
    tasknumber = gets.chomp.to_i

    task_to_delete = Task.find_by(task_number: tasknumber)

    if task_to_delete == nil
      p "Task not found"
      inputs

    else
        task_to_delete.destroy

        task_1 = Task.where(task_number: tasknumber + 1)
        task_1.update(task_number: tasknumber)

        task_2 = Task.where(task_number: tasknumber + 2)
        task_2.update(task_number: tasknumber + 1)

        task_3 = Task.where(task_number: tasknumber + 3)
        task_3.update(task_number: tasknumber + 2)

        task_4 = Task.where(task_number: tasknumber + 4)
        task_4.update(task_number: tasknumber + 3)
      
    end

    p "Your task has been deleted"

  elsif input == "find"

    p "Insert task number"
    tasknumber = gets.chomp.to_i

    newtask = Task.find_by(task_number: tasknumber)
    if newtask == nil
      p "task not found"
      inputs
    else 
      p Task.find_by(task_number: tasknumber)
    end

  elsif input == "exit"

    break


  else 
    p "I don't understand"

  end
end

end

inputs



