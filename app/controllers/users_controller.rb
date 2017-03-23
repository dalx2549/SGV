class UsersController < ApplicationController

  before_action :authenticate_admin!, :except => [:show]

  def index

  end

  def show
    @user = User.find(params[:id])
  end

  def destroy

    @user = User.find(params[:id])
    UsuarioRechazadoMailer.send_email_usuario_re(@user).deliver

    User.find(params[:id]).destroy


    flash[:success] = "Usuario eliminado"
    redirect_to users_url
  end

  def approve
    @user = User.find(params[:id])
    @user.update_attributes(approved: true)
    redirect_to users_url

    email_user_aprobado

  end

  def email_user_aprobado

    @user = User.find(params[:id])

    UsuarioAprobadoMailer.send_email_usuario(@user).deliver

  end

end
