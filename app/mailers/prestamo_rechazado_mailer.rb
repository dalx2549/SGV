class PrestamoRechazadoMailer < ApplicationMailer

  default from: "codeideas.loja@gmail.com"

  def send_email_rechazado(prestamo, persona)

    @user = persona
    @prestamo = prestamo

    mail(to: "#{@user.email}", subject: "Notificación de rechazo de prestamo",
         template_path: 'prestamo_rechazado_mailer', template_name: 'prestamore_email')

  end

end
