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
  describe "relation" do
    context "#file" do
      specify "question_fileを参照出来る" do
        ans = Answer.new
        qf = FactoryGirl.create(:question_file)
        ans.file = qf

        expect(ans.file).to be_true
        expect(ans.file_id).to eq qf.id
      end
    end

    context "#question" do
      specify "questionを参照出来る" do
        pending
      end
    end
  end
end
