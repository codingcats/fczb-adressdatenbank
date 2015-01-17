class SessionsController < ApplicationController
  
  skip_before_action :logged_in_user, only: [:new, :create]
  
  def new
  end

  def create
    user = User.find_by(username: params[:session][:username].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      redirect_to static_pages_home_path
    else
      flash.now[:danger] = 'Username/Passwort Kombination inkorrekt.'
      render 'new'
    end
  end

  def destroy
    user = current_user
    log_out if logged_in?
    forget(user)
    redirect_to root_url
  end
  
end
