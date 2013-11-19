class Answer < ActiveRecord::Base
  belongs_to :file, class_name: "QuestionFile", foreign_key: "file_id"
end
