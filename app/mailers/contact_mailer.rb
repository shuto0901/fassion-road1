class ContactMailer < ApplicationMailer
    default from: "example@example.com"
    default to: "ryuuseiishidachouchou2@gmail.com"
    
    def received_email(contact)
    @contact = contact
    mail(:subject => 'お問い合わせを承りました')
    end
end
