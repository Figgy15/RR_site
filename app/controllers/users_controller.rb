class UsersController < ApplicationController

  def index
    @users = User.all # getting all the users!
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    @tasks = @user.tasks
  end
  def my_rio_runner
    @user = User.find(params[:id])
    @tasks = @user.tasks
    @notifications = @user.notifications
  end
  def create
    @user = User.new(params[:user]) # Not the final implementation!
    if @user.save
      flash[:success] = "User Created Successfully"
    else
      render 'new'
    end
  end

   private

   def user_params
   	params.require(:user).permit(:name, :first_name, :last_name, :email, :password, :password_confirmation, :about_me)
   end
end
