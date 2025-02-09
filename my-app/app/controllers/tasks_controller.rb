class TasksController < ApplicationController
  before_action :set_user, only: [:new, :edit, :create, :index]
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  def index
    @tasks = Task.order(priority: :desc)
    @task = Task.new
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to @task, notice: "タスクが作成されました。"
    else
      render :new
    end
  end

  def edit
    respond_to do |format|
      format.html
      format.turbo_stream { render partial: 'form', locals: { task: @task } }
    end
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      redirect_to @task, notice: "タスクが更新されました。"
    else
      render :edit
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_url, notice: "タスクが削除されました。"
  end

  private

  def task_params
    params.require(:task).permit(:title, :description, :due_date, :status, :user_id, :priority)
  end

  def set_user
    @users = User.all
  end

  def set_task
    @task = Task.find(params[:id])
  end
end