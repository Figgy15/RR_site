class TasksController < ApplicationController

  def index
    @notifications = Notification.all
  end

  def new
    @notifications = Notification.new
  end

  def show
    @notifications = Notification.find(params[:id])

  end

  def create
    @notifications = Notification.new(task_params)
    @notifications.user_id = current_user.id
  end
  def destroy
    @notifications = Notification.find(params[:id])
    @notifications.destroy
    if @notifications.destroy
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


