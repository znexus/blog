class ContactoObserver < ActiveRecord::Observer
  
  def after_create(record)
    ContactoMailer.deliver_aviso(record)
  end
 
end