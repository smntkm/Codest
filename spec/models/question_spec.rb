require 'spec_helper'

describe "FactoryGirl" do
  specify "FactoryGirlが使える" do
    q = FactoryGirl.create(:question)
    expect(q).to be_true
  end
end

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

      specify ":passwordに何も入れないと登録出来ない" do
        @q.hash_password = nil
       expect(@q).to have(1).errors_on(:hash_password)
      end
      
      specify ":emailに何も入れないと登録出来ない" do
        @q.email = nil
        expect(@q).to have(1).errors_on(:email)
      end

      specify "user_fileに何も入れないと登録出来ない" do
        @q.user_file = nil
        expect(@q).to have(1).errors_on(:user_file)
      end
    end
  end

  describe "Relation" do
    context "#user_file" do
      it "問題から問題ファイルが参照出来る" do
        qf = FactoryGirl.create(:question_file)
        q = FactoryGirl.build(:question)

        q.user_file = qf

        q.user_file.should be_true
        q.user_file_id.should eq qf.id
      end
    end

    context "#answers" do
      specify "問題から解答が参照できる" do
        question = FactoryGirl.create(:question)
        a  = FactoryGirl.create(:answer)
        a2 = FactoryGirl.create(:answer)

        question.answers << a
        question.answers << a2

        expect(question.answers.size).to eq 2
      end
    end
  end

  describe "password =" do
    specify "#passwordにパスワード(password)を入れるとハッシュにして保存されている" do
      question = Question.new
      question.password = "password"

      expect(question.hash_password).to eq "password"
    end

    specify "#passwordにpassword入れてpaswordと比較するとfalseになる" do
      question = Question.new
      question.password = "password"

      expect(question.hash_password).not_to eq "pasword"
    end

    specify "#passwordにnilを入れるとnil" do
      question = Question.new
      question.password = nil

      expect(question.hash_password).to eq nil
    end

    specify "#passwordに空文字を入れるとnil" do
      question = Question.new
      question.password = ""

      expect(question.hash_password).to eq nil
    end
  end

  describe "#same_password?" do
    specify "ハッシュパスワードと'same password'を比較するとtrueが返る" do
      FactoryGirl.create(:question, password: "same password")
      question = Question.all.first
      password = "same password"

      actual = question.same_password? password

      expect(actual).to be_true
    end
    
    specify "ハッシュパスワードと'different password'を比較するとfalseが返る" do
      FactoryGirl.create(:question, password: "same password")
      question = Question.all.first
      password = "different password"

      actual = question.same_password? password

      expect(actual).to be_false
    end
  end
end
