class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :store_requested_url
  before_filter :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email, :password, :password_confirmation, :first_name, :last_name, :phone, :about_me) }
  end
  #this is overriding deviseregistrationcontroller for sign in path and going to the home page of the newly created user.
  def after_sign_in_path_for(resource)
    session[:requested_url] || myriorunner_path(@user) #<= see how you pass in the user to get the id....
  end
  #this is overriding deviseregistrationcontroller for sign out path
  #this is eventually going to want to go to root_path but for sake of testing it is going here..

  def after_sign_out_path_for(resource)
    root_path
  end
  private

  def store_requested_url
    #stores last url as long as its not in /users path
    session[:previous_url] = request.fullpath unless request.fullpath =~ /\/users/
  end

end
