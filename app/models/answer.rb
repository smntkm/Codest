class Answer < ActiveRecord::Base
  has_one :file, class_name: "QuestionFile", foreign_key: "id"
  belongs_to :question

  accepts_nested_attributes_for :file

  def file_attributes= data
    q_data = data[:data]
    self.build_file
    self.file.send_file q_data
  end
end
