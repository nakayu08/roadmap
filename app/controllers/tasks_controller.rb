class TasksController < ApplicationController
  before_action :set_task, only: [:edit, :update,:destroy]
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
    if @task.save
      redirect_to tasks_path
    else
      render :new
    end
  end

  def edit
    
  end

  def update
    if @task.update(task_params)
      redirect_to tasks_path
    else
      render :edit
    end
  end

  def destroy
    @task.destroy
    redirect_to  tasks_path
  end

  private

  def task_params
    params.require(:task).permit(:title,:explanation,:category_id,:condition_id,:start_time,:end_time,{:user_ids => []})
  end

  def set_task
    @task = Task.find(params[:id])
  end
end
