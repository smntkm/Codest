# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :answer do
    user_name "hoge"
    question_id  1
    file { FactoryGirl.create(:user_file) }
    email "hoge@example.com"
  end
end
