class ContactMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.contact_mailer.email.subject
  #
  def email
    #byebug
    @post = params[:post]
    @url = 'http://localhost:3000/sign_in'
    mail(to: @post.body, subject: 'Download the cv from')
  end
end
