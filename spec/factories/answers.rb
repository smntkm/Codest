# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :answer do
    user_name "MyString"
    question_id 1
    answer_id 1
    email "MyString"
  end
end
