class TasksController < ApplicationController
  before_action :set_task, only: %i[show edit update destroy]

  def index
    @tasks = policy_scope(Task).order(priority: :desc)
    @priorities = map_priorities(@tasks)
    @groups = policy_scope(Group)
    filter_with_input
    filter_with_group
  end

  def show
    authorize @task
  end

  def new
    @task = Task.new
    @groups = policy_scope(Group)
    authorize @task
  end

  def create
    @task = Task.new(task_params)
    @task.user = current_user
    authorize @task
    if @task.save
      redirect_to tasks_path(@task)
    else
      @groups = policy_scope(Group)
      render 'new', status: :unprocessable_entity
    end
  end

  def edit
    @groups = policy_scope(Group)
    authorize @task
  end

  def update
    authorize @task
    respond_to do |format|
      format.json
      if @task.update(task_params)
        format.html { redirect_to tasks_path(@task) }
      else
        format.html { render 'edit', status: :unprocessable_entity }
      end
    end
  end

  def destroy
    authorize @task
    @task.destroy
    redirect_to tasks_path
  end

  private

  def task_params
    params.require(:task).permit(:title, :details, :completed, :priority, :group_id)
  end

  def set_task
    @task = Task.find(params[:id])
  end

  def map_priorities(iterable)
    iterable.map do |task|
      case task.priority
      when 1 then 'Very low'
      when 2 then 'Low'
      when 3 then 'Medium'
      when 4 then 'High'
      when 5 then 'Very high'
      end
    end
  end

  def filter_with_input
    @tasks = @tasks.where(group_id: params[:group]) if params[:group].present?
  end

  def filter_with_group
    query = 'title ILIKE :query OR details ILIKE :query'
    @tasks = @tasks.where(query, query: "%#{params[:query]}%") if params[:query].present?
  end
end
