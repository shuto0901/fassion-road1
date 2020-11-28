class ContactMailer < ApplicationMailer
    default from: 'from@example.com'
    default to: ENV['KEY'] 

    def received_email(contact)
    @contact = contact
    mail(:subject => 'お問い合わせを承りました')
    end
end
