class TasksController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(project_params)

    respond_to do|format|
      if @task.save
        format.html { redirect_to @task, notice: 'Task was successfully created.'}
        format.json { render action: 'show', status: :created, location: @task}
      else
        format.html {render action: 'new' }
        format.json {render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @task = Task.where(task_id: @task.id)
  end

  def edit
  end

  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to @task, notice: 'Task was successfully updated.'}
        format.json { head :no_content }
      else
        format.html {render action: 'edit' }
        format.json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @task.destroy
    respond_to do |format|
      format.html {redirect_to tasks_url }
      format.json { head :no_content }
    end
  end

  private

  def get_step # to access steps at top level - see routes
    @step = Step.find(params[:id])
  end

  def task_params
      params.require(:task).permit(:title, :text)
  end

end
