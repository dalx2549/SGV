class PrestamoAprobadoMailer < ApplicationMailer

  default from: "codeideas.loja@gmail.com"

  def send_email(prestamo, persona)

    @user = persona
    @prestamo = prestamo

    mail(to: "#{@user.email}", subject: "Notificación de aprobación de prestamo", template_path: 'usuario_aprobado_mailer', template_name: 'usuarioa_email')

  end

end
