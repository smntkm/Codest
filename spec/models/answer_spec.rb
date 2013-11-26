require 'spec_helper'

describe "FactoryGirl" do
  context "#create" do
    specify "作成出来る" do
      ans = FactoryGirl.create(:answer)
      expect(ans).to be_valid
      expect(ans.user_name).to eq "hoge"
    end
  end
end

describe Answer do

  context "#relation_to_question" do
    specify "question_idがあるとき、qeustionとの参照が保存される" do
      pending
      question = FactoryGirl.create(:question)
      ans = FactoryGirl.build(:answer)
      
      ans.question_id = question.id
      expect(ans.question)

      ans.relation_to_question

      expect(ans.question).to be_true
    end
  end

  describe "relation" do
    context "#file" do
      specify "user_fileを参照出来る" do
        ans = Answer.new
        qf = FactoryGirl.create(:user_file)
        ans.file = qf

        expect(ans.file).to be_true
        expect(ans.file_id).to eq qf.id
      end
    end

    context "#question" do
      specify "questionを参照出来る" do
        ans = Answer.new
        q = FactoryGirl.create(:question, file: nil)

        ans.question = q

        expect(ans.question).to be_true
        expect(ans.question_id).to eq q.id
      end
    end
  end
end
