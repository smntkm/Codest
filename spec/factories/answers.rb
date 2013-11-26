# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :answer do
    user_name "hoge"
    question { FactoryGirl.create(:question) }
    user_file { FactoryGirl.create(:user_file) }
    email "hoge@example.com"
  end
end
