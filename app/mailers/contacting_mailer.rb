class ContactingMailer < ApplicationMailer

  def hello(contacting)
    mail_attrs = {
      to:      "hello@takeyourtemp.org",
      subject: "Message from #{contacting.from}",
      from:    'hello@takeyourtemp.org',
      reply_to: contacting.from,
      body:    contacting.message
    }
    mail(mail_attrs)  
  end

end
