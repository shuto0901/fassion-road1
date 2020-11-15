class ContactMailerPreview < ActionMailer::Preview
# ----追記-----
  def contact
     contact = Contact.new(name: "侍 太郎", message: "問い合わせメッセージ")

     ContactMailer.send_mail(contact)
  end
#----追記ここまで----
end