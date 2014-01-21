class TasksController < ApplicationController

  before_filter :authenticate_user!

  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def show
    @task = Task.find(params[:id])
  end

  def create
    @task = Task.new(task_params)
    @task.user_id = current_user.id
    if @task.save
      flash[:success] = "Task Posted Correctly"
      redirect_to myriorunner_path(current_user.id)
    else
      flash.now[:error] = "Could not save Task"
      render 'new'
    end
  end
  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    if @task.destroy
      flash[:success] = "Task Deleted Correctly"
      redirect_to user_path(current_user.id)
    else
      flash.now[:error] = "Could not Delete Task"
      render 'new'
    end
  end

  private
  #def task_params
  #  params.require(:task).permit(:subject, :description, :deliverables, :duration, :price, :due_date)
  #end
  def task_params
    params.require(:task).permit(:user_id, :id, :subject, :description, :deliverables, :zipcode)
  end

end


