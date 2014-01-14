class AnswerMail < ActionMailer::Base
  default from: "from@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.answer_mail.send.subject
  #
  def send
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end