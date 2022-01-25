class MessageMailer < ApplicationMailer

  def message_mail(message)
    @message = message
    mail(
      form: ENV['G_MAIL'],
      to: message.email,
      subject: 'webサイトよりメッセージが届きました',
      bcc: ENV['G_MAIL']
    )
  end

end
