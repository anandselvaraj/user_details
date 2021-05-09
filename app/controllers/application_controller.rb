class ApplicationController < ActionController::Base
  before_action :unauthorized
  #helper_method :logged_in?
  helper_method :current_user, :is_staff?


  def current_user   
    User.find_by(id: session[:user_id])
  end

  def is_staff?
    (current_user.role == 'staff')
  end

  def unauthorized
    redirect_to '/login' unless current_user
  end
end
