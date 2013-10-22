# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :question_file do
    name "MyString"
    content_type "MyString"
    data ""
  end
end
