class TasksController < ApplicationController
  before_action :set_task, only: [:show, :update, :destroy]

  # POST /tasks
  def create
    @task = Task.new(task_params)

    if @task.save
      render json: @task, status: :created
    else
      render json: @task.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /tasks/1
  def update
    if @task.update(task_params)
      render json: @task
    else
      render json: @task.errors, status: :unprocessable_entity
    end
  end

  # DELETE /tasks/1
  def destroy
    @task.destroy
  end

  def sort
    tasks_length = params[:tasks].length
    params[:tasks].each_with_index do |k, v|
      Task.where(project_id: params[:project_id]).update(k, priority: tasks_length - v)
    end
    render body: nil
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def task_params
      params.require(:task).permit(:name, :status, :priority, :deadline, :project_id)
    end
end
