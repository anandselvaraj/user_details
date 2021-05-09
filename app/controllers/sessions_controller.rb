class SessionsController < ApplicationController

  skip_before_action :unauthorized, only: [:new, :create, :welcome]
  
  def new
  end

  def create
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
        session[:user_id] = user.id 
        redirect_to (is_staff?(user) ? user : root_url)
    end
  end

  def welcome
    
  end

  def logout
     current_user = session[:user_id] = nil
     redirect_to root_url  
  end

  def page_requires_login
  end

  private

  def is_staff?(user)
    (user.role == 'staff')
  end
  
end
