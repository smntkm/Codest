class Question < ActiveRecord::Base
  validates :title, :content , presence: true

  has_one :question_file, class_name: "QuestionFile"
end
