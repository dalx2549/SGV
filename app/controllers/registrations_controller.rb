class RegistrationsController < Devise::RegistrationsController

  private

  def sign_up_params

    params.require(:user).permit(:cedula, :name, :last_name, :telephone, :charge, :department, :email, :password, :password_confirmation)

  end


end