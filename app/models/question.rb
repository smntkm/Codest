class Question < ActiveRecord::Base
  validates :title, :content , presence: true
 
  has_one :question_file, class_name: "QuestionFile"

  accepts_nested_attributes_for :question_file

  def question_file_attributes=(data)
    q_data = data[:data]
    self.build_question_file
    self.question_file.name = q_data.original_filename
    self.question_file.content_type = q_data.content_type
    self.question_file.data = q_data.read
  end
end
