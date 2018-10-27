class UserMailer < ApplicationMailer
  default from: 'tengiao@gmail.com'

  def contact_form(email, name, message)
    @message = message
      mail( from: email,
            to: 'tengiao@gmail.com',
            subject: "A new contact form message from #{name}" )
  end
end
