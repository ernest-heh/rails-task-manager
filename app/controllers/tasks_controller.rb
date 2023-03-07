class TasksController < ApplicationController
  # GET All
  def index
    @tasks = Task.all
  end

  # GET a specific task
  def show
    @task = Task.find(params[:id])
  end

  # POST a specific task
  def new
    @task = Task.new
  end

  def create
    @task = Task.create!(create_params)

    redirect_to task_path(@task)
  end

  # PATCH a specific task
  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update(update_params)

    redirect_to task_path(@task)
  end

  # DELETE a specific task
  def destroy
    @task = Task.find(params[:id])
    @task.destroy

    redirect_to tasks_path, status: :see_other
  end

  private

  def create_params
    params.require(:task).permit(:title, :details)
  end

  def update_params
    params.require(:task).permit(:title, :details, :completed)
  end
end
