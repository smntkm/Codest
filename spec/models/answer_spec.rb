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
      question = FactoryGirl.create(:question)
      ans = FactoryGirl.build(:answer)
      ans.question_id = question.id

      expect(ans.question).to be_true
    end
  end

  describe "relation" do
    context "#file" do
      specify "user_fileを参照出来る" do
        ans = Answer.new
        qf = FactoryGirl.create(:answer_file)
        ans.user_file = qf

        expect(ans.user_file).to be_true
        expect(ans.user_file_id).to eq qf.id
      end
    end

    context "#question" do
      specify "questionを参照出来る" do
        ans = Answer.new
        q = FactoryGirl.create(:question)

        ans.question = q

        expect(ans.question).to be_true
        expect(ans.question_id).to eq q.id
      end
    end
  end
end
