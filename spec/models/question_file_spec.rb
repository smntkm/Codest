require 'spec_helper'

describe "FactoryGirl" do
  context "#build" do
    it "正常に使える" do
      fq = FactoryGirl.build(:question_file)

      fq.name.should eq "test.rb"
      fq.content_type.should eq "text/x-ruby-script"
      fq.data.should eq "test = \"test\"\n"
    end
  end
end

describe QuestionFile do
  before(:each) do
     @fq = FactoryGirl.build(:question_file)
  end

  describe "validate" do
    context "値が入っている場合" do
      it "通常に登録が出来る" do
        @fq.should be_valid
      end
    end

    context "値が何もない場合" do
      it '通常登録出来る' do
        fq = QuestionFile.new()

        fq.should be_invalid
        fq.should have(1).errors_on(:name)
        fq.should have(1).errors_on(:content_type)
        fq.should have(1).errors_on(:data)
      end
    end
  end

  describe "Relation" do
    context "問題ファイルから問題に参照がある" do
      it "正常に問題を参照出来る" do
        q = FactoryGirl.create(:question)
        qf = FactoryGirl.build(:question_file)

        qf.question = q
        qf.save

        qf.question.should be_true
        qf.question.id.should eq q.id
      end
    end
  end
end
