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
  describe "Validates" do
    specify "user_nameが空だと登録出来ない" do
      answer = FactoryGirl.build(:answer, user_name: nil)
      expect(answer).to be_invalid
    end

    specify "questionが空だと登録出来ない" do
      answer = FactoryGirl.build(:answer, question: nil)
      expect(answer).to be_invalid
    end
    specify "user_fileが空だと登録出来ない" do
      answer = FactoryGirl.build(:answer, user_file: nil)
      expect(answer).to be_invalid
    end
    specify "emailが空だと登録出来ない" do
      answer = FactoryGirl.build(:answer, email: nil)
      expect(answer).to be_invalid
    end
  end

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
