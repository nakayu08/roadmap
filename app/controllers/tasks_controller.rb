class TasksController < ApplicationController
  def index
    @users = User.all
    @user = User.find(current_user.id)
    @tasks  = @user.tasks
  end

  def show
    @users = User.all
    @user = User.find(params[:id])
    @tasks = @user.tasks
  end

  def new
    @task = Task.new
  end

  def create
    @user = current_user
    @task = @user.tasks.new(task_params)
    #binding.pry
    if @task.save
      redirect_to tasks_path
    else
      #binding.pry
      render :new
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    task = Task.find(params[:id])
    if task.update(task_params)
      redirect_to tasks_path
    else
      render :edit
    end
  end

  private

  def task_params
    #params.require(:task).permit(:title,:start_time,:end_time,:condition_id,:category_id,:explanation)
    params.require(:task).permit(:title,:explanation,:category_id,:condition_id,:start_time,:end_time,{:user_ids => []})

  end

end
