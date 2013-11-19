require 'spec_helper'
#require 'factories/questions'

describe Question do
  #pending "add some examples to (or delete) #{__FILE__}"
  before(:each) do
    @q = FactoryGirl.build(:question)
  end

  describe "validation" do
    context "登録する場合" do
      it "titleに'問題1'と設定し登録すると正常に登録出来る" do
        @q.title = "問題1"
        @q.should be_valid
      end
    
      it "titleが空のままで登録するとエラーになる" do
        @q.title = nil
        @q.should be_invalid
      end

      it ":titleにエラーが設定されている" do
        @q.title = nil
        @q.should have(1).errors_on(:title)
      end

      it "contentに'内容1'と設定し登録すると正常に登録出来る" do
        @q.content = "内容1"
        @q.should be_valid
      end

      it "contentが空のままで登録するとエラーになる" do
        @q.content = nil
        @q.should be_invalid
      end

      it ":titleにエラーが設定されている" do
        @q.content = nil
        @q.should have(1).errors_on(:content)
      end
    end
  end

  describe "Relation" do
    context "問題から問題ファイルに参照がある" do
      it "問題から問題ファイルが参照出来る" do
        qf = FactoryGirl.create(:question_file)
        q = FactoryGirl.build(:question)

        q.file = qf

        q.file.should be_true
        q.file_id.should eq qf.id
      end
    end
  end
end
