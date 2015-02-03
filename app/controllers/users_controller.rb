class UsersController < ApplicationController

  before_action :admin_user,     only: [:index, :edit, :update, :destroy]


  def index
    @users = User.all
  end

  def new
    @users = User.new
  end

  def edit
    @users = User.find(params[:id])
  end

  def show
    @users = User.find(params[:id])
  end


  private

  # Confirms an admin user.
  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end


end
