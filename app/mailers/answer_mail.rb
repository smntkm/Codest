class AnswerMail < ActionMailer::Base
  default from: "codest.master@gmail.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.answer_mail.send.subject
  #
  def send_mail(answer)
    exe_file = Tempfile.new(["#{File.basename(answer.user_file.name, '.rb')}", ".rb"])
    File.open(exe_file, "ab") {|f| f.write(answer.user_file.data) }

    attachments["#{answer.user_file.name}"] = File.read(exe_file)

    @greeting = "#{answer.user_name}様から、#{answer.question.title}の解答が届きました。\n
                 \n
                 #{answer.email}宛に、Feedbackを返して返してあげましょう！
                "
    
    mail to: "#{answer.question.email}", subject: "Codestから解答の送信です。"
  end
end
