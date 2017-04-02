class PrestamoAprobadoMailer < ApplicationMailer

  default from: "gestionvehicularutpl@gmail.com"

  def send_email(prestamo, persona)

    @user = persona
    @prestamo = prestamo

    mail(to: "#{@user.email}", subject: "Notificación de aprobación de prestamo",
         template_path: 'prestamo_aprobado_mailer', template_name: 'prestamoa_email')

  end

end
