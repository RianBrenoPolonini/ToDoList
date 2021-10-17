class TasksController < ApplicationController
  include SessionsHelper
  
  before_action :authorize
  before_action :set_task, only: %i[ show edit update destroy ]
  
  # GET /tasks or /tasks.json
  def index
    @tasks = current_user.tasks.where(list_id: params[:list_id])
  end

  # GET /tasks/1 or /tasks/1.json
  def show
  end

  # GET /tasks/new
  def new
    @task = Task.new
  end

  # GET /tasks/1/edit
  def edit
  end

  # POST /tasks or /tasks.json
  def create
    @task = current_user.tasks.build(task_params)
    @task.list_id = params[:list_id]
    @task.status = false
    if @task.save
      flash[:success] = 'Tarefa cadastrada com sucesso!'
      redirect_to list_tasks_path
    else
      render 'new'
    end
  end

  # PATCH/PUT /tasks/1 or /tasks/1.json
  def update
    if @task.update(task_params)
      flash[:success] = 'Tarefa alterada com sucesso!'
      redirect_to list_tasks_path
    else
      render 'new'
    end
  end

  def update_status
    task = current_user.tasks.find(params[:id])
    task.status = true
    task.save
    flash[:success] = 'Tarefa feita!'
    redirect_to list_tasks_path(task.list_id)
  end

  # DELETE /tasks/1 or /tasks/1.json
  def destroy
    @task.destroy
    flash[:success] = 'Tarefa apagada com sucesso!'
    redirect_to list_tasks_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = current_user.tasks.find_by(id: params[:id])
    end

    # Only allow a list of trusted parameters through.
    def task_params
      params.require(:task).permit(:name, :description, :status, :list_id)
    end
end
