class StepsController < ApplicationController
  before_action :set_task
  before action :set_step, only: [:show, :edit, :update, :destroy]

  def index
    @steps = @task.steps.all
  end

  def show
  end

  def new
    @step = task.steps.new
  end

  def edit
  end

  def create
    @step = @task.steps.create(step_params)
    @step.save?
      (redirect_to task_steps_path, notice: 'Step was successfully created.' )
      ( render action: 'new')
  end

  def update
    @step.update(step_params) ?
      (redirect_to task_steps_path, notice: 'Step was successfully updated.' )
      ( render action: 'new' )
  end

  def destroy
    @step.destroy
    redirect_to task_steps_path
  end

  private
    def set_step
      @step = task.steps.find(params[:id])
    end

    def set_task
      @task = Task.find(params[:task_id])

    def step_params
      params.require(:step.permit(:title, :notes)
    end
end
