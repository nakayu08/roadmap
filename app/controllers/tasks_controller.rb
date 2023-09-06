class TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_task, only: [:edit, :update,:destroy]
  before_action :set_users, only: [:index,:show]
  def index
    @user = User.find(current_user.id)
    @tasks  = @user.tasks
  end

  def show
    if User.exists?(params[:id])
      @user = User.find(params[:id])
      @tasks = @user.tasks
    else
      redirect_to tasks_path
    end
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
      @comments = @task.comments.includes(:user)
      @comment = Comment.new
  end

  def update
    if @task.users.includes(current_user)
      if @task.update(task_params)
        redirect_to tasks_path
      else
        render :edit
      end
    else
      redirect_to tasks_path
    end
  end

  def destroy
    if @task.users.includes(current_user)
      @task.destroy
      redirect_to  tasks_path
    else
      redirect_to tasks_path
    end
  end

  private

  def task_params
    params.require(:task).permit(:title,:explanation,:category_id,:condition_id,:start_time,:end_time,{:user_ids => []})
  end

  def set_task
    if Task.exists?(params[:id])
      @task = Task.find(params[:id])
    else
      redirect_to tasks_path
    end
  end

  def set_users
    @users = User.all
  end
end
