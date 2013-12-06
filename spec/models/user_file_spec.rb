require 'spec_helper'

describe "FactoryGirl" do
  describe ":question_file" do
    context "#build" do
      it "正常に使える" do
        fq = FactoryGirl.build(:question_file)

        fq.name.should eq "sample_test.rb"
        fq.content_type.should eq "text/x-ruby-script"
      end
    end
  end

  describe ":answer_file" do
    context "#build" do
      it "正常に使える" do
        fq = FactoryGirl.build(:answer_file)

        fq.name.should eq "sample.rb"
        fq.content_type.should eq "text/x-ruby-script"
      end
    end
  end
end

describe UserFile do
  describe "validate" do
    context "値が入っている場合" do
      it "通常に登録が出来る" do      
        uf = UserFile.new
        uf.name = "name1"
        uf.content_type = "type1"
        uf.data = "data1"

        uf.should be_valid
      end
    end

    context "値が何もない場合" do
      it '通常登録出来きない' do
        fq = UserFile.new

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
        
        qf.question.should be_true
      end
    end
  end

  describe "#file_data" do
    context "問題ファイルのインスタンスが存在する" do
      it "フィールドが更新される" do
        path = Dir::pwd.to_s + ("/spec/factories/sample.rb")
        user_file = Rack::Test::UploadedFile.new(path, "text/x-ruby-script")

        fq = UserFile.new
        fq.send_file user_file

        fq.should be_valid
        fq.name.should eq 'sample.rb'
      end
    end
  end
end
