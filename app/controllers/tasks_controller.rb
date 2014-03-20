class TasksController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
    3.times {@task.steps.build}
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to @task, notice: 'Task was successfully created.'
    else
      render action: 'new'
    end
  end

  def show
    @task = Task.where(task_id: @task.id)
  end

  def edit
  end

  def update
    if @task.update(task_params)
      redirect_to @task, notice: 'Task was successfully updated.'
      else
        render action: 'edit'
        format.json: { @task.errors, status: :unprocessable_entity }
    end
  end

  def destroy
    @task.destroy
    redirect_to tasks_url
  end

  private

  def set_task# to access steps at top level - see routes
    @task = Task.find(params[:id])
  end

  def task_params
      params.require(:task).permit(:title, :text)
  end

end
