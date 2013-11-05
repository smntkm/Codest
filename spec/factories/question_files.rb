# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  s = Dir::pwd.to_s + ("/spec/factories/test.rb")
  f = Rack::Test::UploadedFile.new(s, "text/x-ruby-script")

  factory :question_file do
    self.name f.original_filename    #test.rb
    self.content_type f.content_type #text/x-ruby-script
    self.data f.read                 #test = "test"\n
  end
end
