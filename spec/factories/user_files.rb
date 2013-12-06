# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user_file do
    question_path = Dir::pwd.to_s + ("/spec/factories/sample_test.rb")
    question_file = Rack::Test::UploadedFile.new(question_path, "text/x-ruby-script")
    
    factory :question_file do
      self.name question_file.original_filename    #ファイル名 sample_test.rb
      self.content_type question_file.content_type #コンテントタイプ text/x-ruby-script
      self.data question_file.read                 #内容
    end

    answer_path = Dir::pwd.to_s + ("/spec/factories/sample.rb")
    answer_file = Rack::Test::UploadedFile.new(answer_path, "text/x-ruby-script")

    factory :answer_file do
      self.name answer_file.original_filename    #ファイル名 sample.rb
      self.content_type answer_file.content_type #コンテントタイプ text/x-ruby-script
      self.data answer_file.read                 #内容
    end
  end
end
