class UsersController < ApplicationController

  before_action :authenticate_admin!, :except => [:show]

  def index

  end

  def show
    @user = User.find(params[:id])
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_url
  end

  def approve
    @user = User.find(params[:id])
    @user.update_attributes(approved: true)
    redirect_to users_url

  end
end
