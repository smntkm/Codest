class Answer < ActiveRecord::Base
  belongs_to :file, class_name: "QuestionFile"
  belongs_to :question

  accepts_nested_attributes_for :file

  def file_attributes= data
    q_data = data[:data]
    self.build_file
    self.file.send_file q_data
  end
end
