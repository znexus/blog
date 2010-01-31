class ContactoMailer < ActionMailer::Base
  
  def aviso(record)

    recipients [ "cristian <ccastillo@z-nexus.com>" ]
    cc ["Cristian <ccastillop@gmail.com>"]
    #bcc mails
    from "robot@cristiancastillo.com"
    reply_to [ record.email ]
    subject "[ccp] Contacto solicitado"
    sent_on Time.now
    body :record => record
          
    content_type "text/html"
 
  end
 
end