class UsuarioAprobadoMailer < ApplicationMailer

  default from: "codeideas.loja@gmail.com"

  def send_email_usuario(persona)

    @user = persona

    mail(to: "#{@user.email}", subject: "Notificación de registro",
         template_path: 'usuario_aprobado_mailer', template_name: 'usuarioa_email')

  end


end
