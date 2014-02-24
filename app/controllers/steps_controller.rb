class StepsController < ApplicationController
  def create
    @task = Task.find(params[:task_id])
    @step = @task.steps.create(params[:steps])
    redirect_to tasks_path(@task)
  end

  def destroy
    @task = Task.find(params[:task_id])
    @step = @task.steps.find(params[:id])
    @step.destroy
    redirect_to tasks_path(@task)
  end
end
