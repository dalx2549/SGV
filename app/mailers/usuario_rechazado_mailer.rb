class UsuarioRechazadoMailer < ApplicationMailer

  default from: "codeideas.loja@gmail.com"

  def send_email_usuario_re(persona)

    @user = persona

    mail(to: "#{@user.email}", subject: "Notificación de registro",
         template_path: 'usuario_rechazado_mailer', template_name: 'usuarior_email')

  end

end
