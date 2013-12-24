# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :question do
    title "MyString"
    content "MyString"
    user_file { FactoryGirl.create(:question_file) }
    password "password"
    email "hoge@hoge.com"
  end
end
