class ChoferRegistradoMailer < ApplicationMailer

  default from: "gestionvehicularutpl@gmail.com"

  def send_email_chofer(chofer)

    @chofer = chofer

    mail(to: "#{@chofer.email}", subject: "Notificación de registro",
         template_path: 'chofer_registrado_mailer', template_name: 'chofer_email')

  end

end
