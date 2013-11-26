# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :question do
    title "MyString"
    content "MyString"
    user_file { FactoryGirl.create(:user_file) }
  end
end
