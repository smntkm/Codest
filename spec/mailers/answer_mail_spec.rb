require "spec_helper"

describe AnswerMail do
  describe "send" do
    let(:question) { FactoryGirl.create(:question, email: "question@example.com") }
    let(:answer) { FactoryGirl.create(:answer, question: question, email: "answer@example.com") }
    let(:mail) { AnswerMail.send_mail answer }

    it "renders the headers" do
      mail.subject.should eq("Codestから解答の送信です。")
      mail.to.should eq(["#{question.email}"])
      mail.from.should eq(["codest.master@gmail.com"])
    end
  end
end
