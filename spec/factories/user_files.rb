# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  s = Dir::pwd.to_s + ("/spec/factories/sample.rb")
  f = Rack::Test::UploadedFile.new(s, "text/x-ruby-script")

  factory :user_file do
    self.name f.original_filename    #sample.rb
    self.content_type f.content_type #text/x-ruby-script
    self.data f.read                 #内容
  end
end
